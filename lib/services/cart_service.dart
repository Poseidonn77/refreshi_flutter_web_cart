import 'package:get/get.dart';

import '../models/product.dart';
import 'storage_service.dart';

/// The current cart, shared app-wide and kept in Hive when [StorageService]
/// is available. Quantities are keyed by [Product.id].
///
/// TODO: sync with the server once the schema exposes cart mutations.
class CartService extends GetxService {
  /// Id of the cart being filled. It becomes the order id when the order is
  /// placed (`/cart/3` -> `/checkout/3` -> `/order/3`); then a new cart
  /// starts with the next id.
  ///
  /// TODO: with a real backend let the server allocate cart ids.
  final RxString cartId = '1'.obs;

  final RxMap<String, int> quantities = <String, int>{}.obs;

  StorageService? get _storage =>
      Get.isRegistered<StorageService>() ? Get.find<StorageService>() : null;

  @override
  void onInit() {
    super.onInit();
    final storage = _storage;
    if (storage == null) return;
    quantities.assignAll(storage.cartQuantities);
    cartId.value = storage.lastCartId ?? '1';
  }

  bool isCurrent(String id) => id == cartId.value;

  /// Cart item names for the order, e.g. `2 × Sourdough loaf`.
  List<String> get itemLabels => [
    for (final l in lines)
      l.quantity == 1 ? l.product.name : '${l.quantity} × ${l.product.name}',
  ];

  /// After an order is placed: empty the cart and move to the next id.
  void startNextCart() {
    final next = (int.tryParse(cartId.value) ?? 0) + 1;
    cartId.value = '$next';
    _storage?.setLastCartId(cartId.value);
    clear();
  }

  int quantityOf(Product product) => quantities[product.id] ?? 0;

  /// Total number of units in the cart (what the badge shows).
  int get count => quantities.values.fold(0, (sum, q) => sum + q);

  int get totalInCents => lines.fold(
    0,
    (sum, line) => sum + line.product.priceInCents * line.quantity,
  );

  /// Cart contents in catalog order; ids no longer in the catalog are skipped.
  List<({Product product, int quantity})> get lines => [
    for (final product in Product.catalog)
      if (quantityOf(product) > 0)
        (product: product, quantity: quantityOf(product)),
  ];

  void add(Product product) {
    quantities[product.id] = quantityOf(product) + 1;
    _persist();
  }

  void remove(Product product) {
    final q = quantityOf(product);
    if (q <= 1) {
      quantities.remove(product.id);
    } else {
      quantities[product.id] = q - 1;
    }
    _persist();
  }

  void clear() {
    quantities.clear();
    _persist();
  }

  void _persist() => _storage?.setCartQuantities(Map.of(quantities));
}
