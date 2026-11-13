import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webview_cart/database/queries/fetch_cart.graphql.dart';
import 'package:flutter_webview_cart/database/queries/fetch_order.graphql.dart';
import 'package:flutter_webview_cart/database/scalars.dart';

void main() {
  final tenUtc = DateTime.utc(2026, 11, 13, 10);

  group('ISODateTime', () {
    test('accepts zoned, zone-less, epoch ms/s and numeric strings', () {
      expect(fromJsonIsoDateTime('2026-11-13T10:00:00Z'), tenUtc);
      expect(fromJsonIsoDateTime('2026-11-13T12:00:00+02:00'), tenUtc);
      expect(fromJsonIsoDateTime('2026-11-13T10:00:00'), tenUtc);
      expect(fromJsonIsoDateTime('2026-11-13 10:00:00'), tenUtc);
      expect(fromJsonIsoDateTime(tenUtc.millisecondsSinceEpoch), tenUtc);
      expect(
        fromJsonIsoDateTime(tenUtc.millisecondsSinceEpoch ~/ 1000),
        tenUtc,
      );
      expect(fromJsonIsoDateTime('${tenUtc.millisecondsSinceEpoch}'), tenUtc);
      expect(fromJsonIsoDateTime('2026-11-13T10:00:00').isUtc, isTrue);
    });

    test('round-trips', () {
      expect(fromJsonIsoDateTime(toJsonIsoDateTime(tenUtc)), tenUtc);
    });

    test('rejects garbage with a FormatException', () {
      expect(() => fromJsonIsoDateTime(true), throwsFormatException);
      expect(() => fromJsonIsoDateTime('soon'), throwsFormatException);
    });
  });

  test('ID accepts strings and numbers', () {
    expect(fromJsonId('c1'), 'c1');
    expect(fromJsonId(7), '7');
    expect(fromJsonId(7.0), '7');
  });

  test('Int accepts ints, JS-style doubles and numeric strings', () {
    expect(fromJsonInt(1250), 1250);
    expect(fromJsonInt(1250.0), 1250);
    expect(fromJsonInt('1250'), 1250);
    expect(fromJsonInt(12.5), 13);
    expect(() => fromJsonInt('abc'), throwsFormatException);
  });

  test('FetchCart parses a loosely-typed payload', () {
    final cart = Query$FetchCart.fromJson({
      '__typename': 'Query',
      'fetchCart': {
        '__typename': 'Cart',
        'id': 7,
        'items': ['A'],
        'lastUpdated': tenUtc.millisecondsSinceEpoch,
      },
    }).fetchCart!;
    expect(cart.id, '7');
    expect(cart.lastUpdated, tenUtc);
  });

  test('FetchOrder parses numeric ids, double amount, zone-less slots', () {
    final order = Query$FetchOrder.fromJson({
      '__typename': 'Query',
      'fetchOrder': {
        '__typename': 'Order',
        'id': 42,
        'dateOfOrder': null,
        'timeSlotStart': '2026-11-13T17:00:00',
        'timeSlotEnd': '2026-11-13T18:00:00',
        'cart': {
          '__typename': 'Cart',
          'id': 7,
          'items': null,
          'lastUpdated': null,
        },
        'pay': {
          '__typename': 'Pay',
          'id': 3,
          'amountInCents': 1250.0,
          'holdRequestTime': null,
          'payCaptureTime': null,
        },
      },
    }).fetchOrder!;
    expect(order.id, '42');
    expect(order.cart!.id, '7');
    expect(order.pay!.amountInCents, 1250);
    expect(order.timeSlotStart, DateTime.utc(2026, 11, 13, 17));
  });
}
