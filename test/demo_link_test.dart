import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webview_cart/controller/cart_controller.dart';
import 'package:flutter_webview_cart/controller/order_controller.dart';
import 'package:flutter_webview_cart/controller/payment_controller.dart';
import 'package:flutter_webview_cart/database/demo_link.dart';
import 'package:get/get.dart' hide Response;
import 'package:graphql_flutter/graphql_flutter.dart';

/// Simulates the browser's "Failed to fetch" when nothing is listening.
class UnreachableLink extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) =>
      Stream.error(
        ServerException(
          originalException: Exception('ClientException: Failed to fetch'),
          parsedResponse: null,
        ),
      );
}

GraphQLClient client(Link link) => GraphQLClient(
  link: link,
  cache: GraphQLCache(store: InMemoryStore()),
);

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  final demo = client(DemoLink(latency: Duration.zero));

  test('demo serves cart, payment and order for the same id', () async {
    final cart = CartController(client: demo);
    final pay = PaymentController(client: demo);
    final order = OrderController(client: demo);
    await Future.wait([
      cart.fetchCart('2'),
      pay.fetchPay('2'),
      order.fetchOrder('2'),
    ]);

    expect(cart.data.value!.items, ['Margherita pizza', 'Tiramisu']);
    expect(pay.formattedAmount, '23.90');
    expect(order.data.value!.cart!.items, hasLength(2));
    expect(order.data.value!.timeSlotStart, DateTime.utc(2026, 11, 13, 18));
  });

  test('demo returns null for unknown ids (shows "Nothing found")', () async {
    final cart = CartController(client: demo);
    await cart.fetchCart('999');
    expect(cart.error.value, isNull);
    expect(cart.data.value, isNull);
  });

  test('unreachable server gives a readable error, not a stack dump', () async {
    final cart = CartController(client: client(UnreachableLink()));
    await cart.fetchCart('1');
    expect(cart.error.value, startsWith("Can't reach the GraphQL server"));
    expect(cart.error.value, isNot(contains('dart-sdk')));
  });
}
