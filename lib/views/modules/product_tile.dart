import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../models/product.dart';
import '../../services/cart_service.dart';

/// A product row (image, name, price) with -/+ controls bound to the
/// [CartService]. Used in lists: the mobile catalog and the cart.
class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ProductImage(product: product, size: 56),
      ),
      title: Text(product.name),
      subtitle: Text(
        product.price,
        style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w600),
      ),
      trailing: QuantityControls(product: product),
    );
  }
}

/// A catalog card for the tablet/desktop grid: large image on top, then
/// name, price and the same -/+ controls as [ProductTile].
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: ProductImage(product: product)),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        product.price,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                QuantityControls(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The product's bundled image, with an icon if the asset is missing.
class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product, this.size});

  final Product product;

  /// Square size; null fills the available space.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Image.asset(
      product.imageAsset,
      width: size,
      height: size,
      fit: BoxFit.cover,
      semanticLabel: product.name,
      errorBuilder: (_, _, _) => Container(
        width: size,
        height: size,
        color: scheme.primaryContainer,
        alignment: Alignment.center,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: scheme.onPrimaryContainer,
        ),
      ),
    );
  }
}

/// "Add" when the product isn't in the cart, otherwise - qty +.
class QuantityControls extends StatelessWidget {
  const QuantityControls({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartService>();
    return Obx(() {
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
          Text(
            '$qty',
            key: Key('qty-${product.id}'),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            key: Key('add-${product.id}'),
            tooltip: 'Add one',
            icon: const Icon(Icons.add_circle),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => cart.add(product),
          ),
        ],
      );
    });
  }
}
