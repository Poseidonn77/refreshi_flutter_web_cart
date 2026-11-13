import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/app_routes.dart';
import '../../controller/cart_controller.dart';
import '../modules/cart_item.dart';
import '../modules/query_state_view.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart ${controller.routeId}')),
      body: QueryStateView(
        controller: controller,
        onRetry: () => controller.fetchCart(controller.routeId),
        builder: (cart) => ListView(
          children: [
            for (final item in cart.items ?? const <String>[])
              CartItem(name: item),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.payment),
        label: const Text('Checkout'),
        onPressed: () => Get.toNamed(Routes.checkoutPath(controller.routeId)),
      ),
    );
  }
}
