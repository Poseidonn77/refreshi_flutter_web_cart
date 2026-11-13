import 'package:graphql_flutter/graphql_flutter.dart';

import '../database/queries/fetch_orders.graphql.dart';
import '../models/order_status.dart';
import 'base_query_controller.dart';
import 'status_refresh.dart';

typedef OrderSummary = Query$FetchOrders$fetchOrders;

/// `/orders`: order history, newest first. Refreshes when the soonest
/// status change among the listed orders is due.
class OrdersController extends BaseQueryController<List<OrderSummary>>
    with StatusRefresh {
  OrdersController({super.client, DateTime Function()? clock})
    : _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders({bool silent = false}) async {
    await run(
      () => client.query$FetchOrders(
        Options$Query$FetchOrders(fetchPolicy: FetchPolicy.networkOnly),
      ),
      (parsed) => parsed.fetchOrders,
      silent: silent,
    );
    final now = _clock();
    DateTime? soonest;
    for (final o in data.value ?? const <OrderSummary>[]) {
      final t = nextStatusChange(
        status: o.status,
        now: now,
        holdRequestTime: o.pay?.holdRequestTime,
        slotStart: o.timeSlotStart,
        slotEnd: o.timeSlotEnd,
      );
      if (t != null && (soonest == null || t.isBefore(soonest))) soonest = t;
    }
    scheduleRefresh(soonest, () => fetchOrders(silent: true), clock: _clock);
  }
}
