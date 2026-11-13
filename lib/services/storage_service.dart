import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

/// Local key/value persistence backed by Hive (IndexedDB on web).
class StorageService extends GetxService {
  static const String _boxName = 'app';
  static const String _signedInKey = 'signedIn';
  static const String _lastCartIdKey = 'lastCartId';

  late final Box<dynamic> _box;

  Future<StorageService> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<dynamic>(_boxName);
    return this;
  }

  bool get isSignedIn => _box.get(_signedInKey, defaultValue: false) as bool;
  Future<void> setSignedIn(bool value) => _box.put(_signedInKey, value);

  String? get lastCartId => _box.get(_lastCartIdKey) as String?;
  Future<void> setLastCartId(String id) => _box.put(_lastCartIdKey, id);
}
