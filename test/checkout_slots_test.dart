import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webview_cart/app/app_routes.dart';
import 'package:flutter_webview_cart/database/demo_link.dart';
import 'package:flutter_webview_cart/main.dart';
import 'package:flutter_webview_cart/models/delivery_slot.dart';
import 'package:flutter_webview_cart/services/graphql_service.dart';
import 'package:flutter_webview_cart/services/storage_service.dart';
import 'package:get/get.dart' hide Response;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_ce/hive.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  late Directory hiveDir;

  setUp(() async {
    Get.testMode = true;
    hiveDir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(hiveDir.path);
    Get.put(StorageService(await Hive.openBox<dynamic>('app')));
    Get.put(
      GraphQLService(
        GraphQLClient(
          link: DemoLink(latency: Duration.zero),
          cache: GraphQLCache(store: InMemoryStore()),
        ),
      ),
    );
  });

  tearDown(() async {
    Get.reset();
    await Hive.close();
    await hiveDir.delete(recursive: true);
  });

  test('three fixed one-hour slots from 19:00', () {
    final slots = DeliverySlot.fixedFor(DateTime(2026, 11, 13, 9));
    expect(slots.map((s) => s.label), [
      '19:00 – 20:00',
      '20:00 – 21:00',
      '21:00 – 22:00',
    ]);
    expect(DeliverySlot.fromJson(slots.first.toJson()), slots.first);
  });

  testWidgets('checkout requires a slot and the order shows it', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    Get.toNamed(Routes.checkoutPath('1'));
    await tester.pumpAndSettle();

    expect(find.byType(ChoiceChip), findsNWidgets(3));
    final button = find.widgetWithText(FilledButton, 'Choose a delivery time');
    expect(tester.widget<FilledButton>(button).onPressed, isNull);

    await tester.tap(find.text('20:00 – 21:00'));
    await tester.pump();
    await tester.tap(find.text('Place order'));
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pumpAndSettle();

    expect(Get.currentRoute, Routes.orderPath('1'));
    // Demo server says 17:00; the slot chosen at checkout wins.
    expect(find.text('20:00 – 21:00'), findsOneWidget);
    expect(Get.find<StorageService>().orderSlot('1')?.label, '20:00 – 21:00');
  });
}
