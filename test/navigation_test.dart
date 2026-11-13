import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webview_cart/app/app_routes.dart';
import 'package:flutter_webview_cart/controller/sign_in_controller.dart';
import 'package:flutter_webview_cart/main.dart';
import 'package:flutter_webview_cart/services/graphql_service.dart';
import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import 'support/graphql_mock.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(GraphQLService(clientFor(MockLink({}))));
  });
  tearDown(Get.reset);

  testWidgets('landing navigates to merchants and details', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Lovable Food'), findsOneWidget);

    await tester.tap(find.text('Merchants near me'));
    await tester.pumpAndSettle();
    expect(Get.currentRoute, Routes.geoMerchants);

    await tester.tap(find.text('Merchant 2'));
    await tester.pumpAndSettle();
    expect(Get.currentRoute, Routes.detailsPath('2'));
    expect(Get.parameters['id'], '2');
  });

  testWidgets('cart route binds CartController with :id', (tester) async {
    await tester.pumpWidget(const MyApp());
    Get.toNamed(Routes.cartPath('7'));
    await tester.pumpAndSettle();

    expect(find.text('Cart 7'), findsOneWidget);
    expect(find.textContaining('No mock for FetchCart'), findsOneWidget);
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
