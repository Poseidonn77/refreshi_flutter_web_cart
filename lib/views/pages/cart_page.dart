import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';
import '../../models/product.dart';
import '../../services/cart_service.dart';
import '../modules/ordered_cart_notice.dart';
import '../modules/product_tile.dart';
import '../modules/responsive.dart';

/// `/cart/:id` — the cart being filled (from [CartService]) with -/+
/// controls and total. Other ids point to the order they became.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartService>();
    final id = routeIdOf(context);
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), title: Text('Cart #$id')),
      body: Obx(() {
        if (!cart.isCurrent(id)) return OrderedCartNotice(id: id);
        final lines = cart.lines;
        if (lines.isEmpty) {
          return const Center(child: Text('Your cart is empty'));
        }
        return ListView(
          padding: context.pagePadding(maxWidth: 720, flush: true, bottom: 96),
          children: [
            for (final line in lines) ProductTile(product: line.product),
            const Divider(),
            ListTile(
              title: const Text('Total'),
              trailing: Text(
                Product.formatCents(cart.totalInCents),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: Obx(
        () => !cart.isCurrent(id) || cart.count == 0
            ? const SizedBox.shrink()
            : FloatingActionButton.extended(
                icon: const Icon(Icons.payment),
                label: const Text('Checkout'),
                onPressed: () => Nav.checkout(id),
              ),
      ),
    );
  }
}
