import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../models/product.dart';
import '../../services/cart_service.dart';

/// A product row with -/+ controls bound to the [CartService].
class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartService>();
    return ListTile(
      leading: const Icon(Icons.shopping_bag_outlined),
      title: Text(product.name),
      subtitle: Text(product.price),
      trailing: Obx(() {
        final qty = cart.quantityOf(product);
        if (qty == 0) {
          return FilledButton.tonalIcon(
            key: Key('add-${product.id}'),
            icon: const Icon(Icons.add),
            label: const Text('Add'),
            onPressed: () => cart.add(product),
          );
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: Key('remove-${product.id}'),
              tooltip: 'Remove one',
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => cart.remove(product),
            ),
            Text('$qty', key: Key('qty-${product.id}')),
            IconButton(
              key: Key('add-${product.id}'),
              tooltip: 'Add one',
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => cart.add(product),
            ),
          ],
        );
      }),
    );
  }
}
