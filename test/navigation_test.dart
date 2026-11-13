import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webview_cart/app/app_routes.dart';
import 'package:flutter_webview_cart/controller/sign_in_controller.dart';
import 'package:flutter_webview_cart/main.dart';
import 'package:flutter_webview_cart/models/product.dart';
import 'package:flutter_webview_cart/services/cart_service.dart';
import 'package:flutter_webview_cart/services/graphql_service.dart';
import 'package:get/get.dart' hide Response;
import 'package:material_ui/material_ui.dart';

import 'support/graphql_mock.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(GraphQLService(clientFor(MockLink({}))));
  });
  tearDown(Get.reset);

  testWidgets('landing shows catalog and a cart badge, no merchants link', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Lovable Food'), findsOneWidget);
    expect(find.text('Merchants near me'), findsNothing);
    expect(find.text('Sourdough loaf'), findsOneWidget);
    expect(find.byTooltip('Cart (0)'), findsOneWidget);
  });

  testWidgets('catalog adds and removes items; badge follows', (tester) async {
    await tester.pumpWidget(const MyApp());
    final cart = Get.find<CartService>();

    await tester.tap(find.byKey(const Key('add-sourdough')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('add-sourdough')));
    await tester.tap(find.byKey(const Key('add-eggs')));
    await tester.pump();
    expect(find.byKey(const Key('qty-sourdough')), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(cart.count, 3);
    expect(find.byTooltip('Cart (3)'), findsOneWidget);

    await tester.tap(find.byKey(const Key('remove-sourdough')));
    await tester.tap(find.byKey(const Key('remove-eggs')));
    await tester.pump();
    expect(cart.count, 1);
    expect(cart.quantities, {'sourdough': 1});
    expect(find.byTooltip('Cart (1)'), findsOneWidget);
  });

  testWidgets('cart button opens cart with lines and total', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byTooltip('Cart (0)'));
    await tester.pumpAndSettle();
    expect(Get.currentRoute, Routes.cartPath(CartService.cartId));
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);

    final cart = Get.find<CartService>();
    final pizza = Product.catalog.firstWhere((p) => p.id == 'pizza');
    cart
      ..add(pizza)
      ..add(pizza);
    await tester.pump();
    expect(find.text('Margherita pizza'), findsOneWidget);
    expect(find.text('31.80'), findsOneWidget);
    expect(find.text('Checkout'), findsOneWidget);
  });

  testWidgets('merchants near me page still navigates to details', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    Get.toNamed(Routes.geoMerchants);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Merchant 2'));
    await tester.pumpAndSettle();
    expect(Get.currentRoute, Routes.detailsPath('2'));
    expect(Get.parameters['id'], '2');
  });

  testWidgets('sign-in redirects after the timer', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(Get.currentRoute, Routes.signIn);
    expect(Get.isRegistered<SignInController>(), isTrue);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(Get.currentRoute, Routes.geoMerchants);
  });
}
