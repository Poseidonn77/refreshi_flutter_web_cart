import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../models/delivery_slot.dart';

/// Local key/value persistence backed by Hive (IndexedDB on web).
class StorageService extends GetxService {
  /// Pass an already-open [box] in tests; otherwise call [init].
  StorageService([this._box]);

  static const String _boxName = 'app';
  static const String _lastCartIdKey = 'lastCartId';
  static const String _cartKey = 'cart';
  static String _orderSlotKey(String orderId) => 'orderSlot:$orderId';

  Box<dynamic>? _box;
  Box<dynamic> get box => _box!;

  Future<StorageService> init() async {
    await Hive.initFlutter();
    _box ??= await Hive.openBox<dynamic>(_boxName);
    return this;
  }

  String? get lastCartId => box.get(_lastCartIdKey) as String?;
  Future<void> setLastCartId(String id) => box.put(_lastCartIdKey, id);

  /// Product id -> quantity for the current cart.
  Map<String, int> get cartQuantities {
    final raw = box.get(_cartKey);
    if (raw is! Map) return {};
    return {
      for (final e in raw.entries)
        if (e.value is int) e.key.toString(): e.value as int,
    };
  }

  Future<void> setCartQuantities(Map<String, int> value) =>
      box.put(_cartKey, value);

  /// Delivery slot chosen at checkout for an order.
  DeliverySlot? orderSlot(String orderId) =>
      DeliverySlot.fromJson(box.get(_orderSlotKey(orderId)));
  Future<void> setOrderSlot(String orderId, DeliverySlot slot) =>
      box.put(_orderSlotKey(orderId), slot.toJson());
}
