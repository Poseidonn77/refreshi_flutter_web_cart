import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webview_cart/controller/cart_controller.dart';
import 'package:flutter_webview_cart/controller/order_controller.dart';
import 'package:flutter_webview_cart/controller/payment_controller.dart';
import 'package:get/get.dart' hide Response;

import 'support/graphql_mock.dart';

const cartJson = {
  '__typename': 'Cart',
  'id': 'c1',
  'items': ['Apples', 'Bread'],
  'lastUpdated': '2026-11-13T10:00:00Z',
};
const payJson = {
  '__typename': 'Pay',
  'id': 'p1',
  'holdRequestTime': '2026-11-13T10:05:00Z',
  'payCaptureTime': null,
  'amountInCents': 1250,
};

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  final link = MockLink({
    'FetchCart': {'__typename': 'Query', 'fetchCart': cartJson},
    'FetchPay': {'__typename': 'Query', 'fetchPay': payJson},
    'FetchOrder': {
      '__typename': 'Query',
      'fetchOrder': {
        '__typename': 'Order',
        'id': 'o1',
        'dateOfOrder': '2026-11-13T10:06:00Z',
        'timeSlotStart': '2026-11-13T17:00:00Z',
        'timeSlotEnd': '2026-11-13T18:00:00Z',
        'cart': cartJson,
        'pay': payJson,
      },
    },
  });

  test('FetchCart parses items and ISODateTime scalar', () async {
    final c = CartController(client: clientFor(link));
    await c.fetchCart('c1');

    expect(c.error.value, isNull);
    expect(c.data.value!.items, ['Apples', 'Bread']);
    expect(c.data.value!.lastUpdated, DateTime.utc(2026, 11, 13, 10));
    expect(link.requests.last.variables, {'id': 'c1'});
  });

  test('FetchPay parses amount and nullable dates', () async {
    final c = PaymentController(client: clientFor(link));
    await c.fetchPay('p1');

    expect(c.data.value!.amountInCents, 1250);
    expect(c.data.value!.payCaptureTime, isNull);
    expect(c.formattedAmount, '12.50');
  });

  test('FetchOrder parses nested cart, pay and time slot', () async {
    final c = OrderController(client: clientFor(link));
    await c.fetchOrder('o1');

    final order = c.data.value!;
    expect(order.cart!.items, hasLength(2));
    expect(order.pay!.amountInCents, 1250);
    expect(order.timeSlotEnd!.difference(order.timeSlotStart!).inHours, 1);
  });

  test('GraphQL errors surface on the controller', () async {
    final c = CartController(client: clientFor(MockLink({})));
    await c.fetchCart('x');

    expect(c.data.value, isNull);
    expect(c.error.value, contains('No mock for FetchCart'));
    expect(c.isLoading.value, isFalse);
  });
}
