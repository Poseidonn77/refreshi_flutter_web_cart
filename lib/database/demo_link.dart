import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_ce/hive.dart';

/// Offline GraphQL backend for the web demo, used when no `GRAPHQL_ENDPOINT`
/// is defined. Answers the operations in `lib/database/queries/`.
///
/// Orders live in memory and, when a Hive [box] is given, are persisted there
/// (IndexedDB on web) so order history survives a reload. Unknown ids resolve
/// to `null` ("Nothing found").
///
/// Like a payment provider, the "server" captures a held payment
/// [captureAfter] after the hold; order status is derived from the payment
/// and the delivery slot at read time.
class DemoLink extends Link {
  DemoLink({
    this.latency = const Duration(milliseconds: 300),
    this.captureAfter = const Duration(seconds: 5),
    Box<dynamic>? box,
    DateTime Function()? clock,
  }) : _box = box,
       _clock = clock ?? DateTime.now {
    final saved = box?.get(_ordersKey);
    if (saved is Map) {
      saved.forEach((id, o) {
        if (o is Map) _orders[id.toString()] = Map<String, dynamic>.from(o);
      });
    }
  }

  static const String boxName = 'demo_db';
  static const String _ordersKey = 'orders';

  final Duration latency;
  final Duration captureAfter;
  final Box<dynamic>? _box;
  final DateTime Function() _clock;

  /// Raw order records keyed by id (see [_placeOrder] for the shape).
  final Map<String, Map<String, dynamic>> _orders = {};

  static String operationName(Request request) =>
      request.operation.operationName ??
      request.operation.document.definitions
          .whereType<OperationDefinitionNode>()
          .first
          .name!
          .value;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    final id = request.variables['id']?.toString();
    final name = operationName(request);
    _captureDuePayments();
    Map<String, dynamic>? data;
    String? error;
    switch (name) {
      case 'FetchCart':
        data = {'__typename': 'Query', 'fetchCart': _cart(_orders[id])};
      case 'FetchPay':
        data = {'__typename': 'Query', 'fetchPay': _pay(_orders[id])};
      case 'FetchOrder':
        data = {'__typename': 'Query', 'fetchOrder': _order(_orders[id])};
      case 'FetchOrders':
        final all = _orders.values.toList()
          ..sort(
            (a, b) => (b['dateOfOrder'] as String).compareTo(
              a['dateOfOrder'] as String,
            ),
          );
        data = {
          '__typename': 'Query',
          'fetchOrders': [for (final o in all) _order(o)],
        };
      case 'PlaceOrder':
        final input = request.variables['input'];
        if (input is! Map) {
          error = 'placeOrder: missing input';
        } else if (_orders.containsKey(input['id']?.toString())) {
          error = 'Order ${input['id']} already exists';
        } else {
          data = {
            '__typename': 'Mutation',
            'placeOrder': _order(_placeOrder(input)),
          };
        }
      default:
        error = 'Demo backend: no "$name"';
    }
    yield data == null
        ? Response(
            errors: [GraphQLError(message: error ?? 'Demo backend error')],
            response: const {},
          )
        : Response(data: data, response: {'data': data});
  }

  // ---- writes --------------------------------------------------------------

  String _now() => _clock().toUtc().toIso8601String();

  Map<String, dynamic> _placeOrder(Map<dynamic, dynamic> input) {
    final now = _now();
    final order = <String, dynamic>{
      'id': input['id'].toString(),
      'dateOfOrder': now,
      'items': [for (final i in input['items'] as List) i.toString()],
      'amountInCents': input['amountInCents'],
      'timeSlotStart': input['timeSlotStart'],
      'timeSlotEnd': input['timeSlotEnd'],
      'holdRequestTime': now,
      'payCaptureTime': null,
    };
    _orders[order['id'] as String] = order;
    _persist();
    return order;
  }

  /// Captures every hold older than [captureAfter] (lazily, on each request).
  void _captureDuePayments() {
    final now = _clock();
    var changed = false;
    for (final o in _orders.values) {
      final held = DateTime.tryParse(o['holdRequestTime'] as String? ?? '');
      if (held == null || o['payCaptureTime'] != null) continue;
      final due = held.add(captureAfter);
      if (!now.isBefore(due)) {
        o['payCaptureTime'] = due.toUtc().toIso8601String();
        changed = true;
      }
    }
    if (changed) _persist();
  }

  void _persist() => _box?.put(_ordersKey, {
    for (final e in _orders.entries) e.key: Map<String, dynamic>.of(e.value),
  });

  // ---- reads (GraphQL shapes) ---------------------------------------------

  String _status(Map<String, dynamic> o) {
    if (o['payCaptureTime'] == null) return 'PLACED';
    final now = _clock();
    final start = DateTime.tryParse(o['timeSlotStart'] as String? ?? '');
    final end = DateTime.tryParse(o['timeSlotEnd'] as String? ?? '');
    if (end != null && !now.isBefore(end)) return 'DELIVERED';
    if (start != null && !now.isBefore(start)) return 'OUT_FOR_DELIVERY';
    return 'CONFIRMED';
  }

  Map<String, dynamic>? _cart(Map<String, dynamic>? o) => o == null
      ? null
      : {
          '__typename': 'Cart',
          'id': o['id'],
          'items': o['items'],
          'lastUpdated': o['dateOfOrder'],
        };

  Map<String, dynamic>? _pay(Map<String, dynamic>? o) => o == null
      ? null
      : {
          '__typename': 'Pay',
          'id': o['id'],
          'holdRequestTime': o['holdRequestTime'],
          'payCaptureTime': o['payCaptureTime'],
          'amountInCents': o['amountInCents'],
        };

  Map<String, dynamic>? _order(Map<String, dynamic>? o) => o == null
      ? null
      : {
          '__typename': 'Order',
          'id': o['id'],
          'dateOfOrder': o['dateOfOrder'],
          'status': _status(o),
          'timeSlotStart': o['timeSlotStart'],
          'timeSlotEnd': o['timeSlotEnd'],
          'cart': _cart(o),
          'pay': _pay(o),
        };
}
