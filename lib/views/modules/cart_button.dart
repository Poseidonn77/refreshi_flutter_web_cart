import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../services/cart_service.dart';
import 'responsive.dart';
import '../../app/nav.dart';

/// App-bar cart button with a badge showing how many items are in the cart.
/// Icon-only on mobile; icon + "Cart" label on wider screens.
class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartService>();
    final compact = context.isMobile;
    return Obx(() {
      final count = cart.count;
      final icon = Badge.count(
        count: count,
        isLabelVisible: count > 0,
        child: const Icon(Icons.shopping_cart_outlined),
      );
      return Tooltip(
        message: 'Cart ($count)',
        child: compact
            ? IconButton(onPressed: Nav.cart, icon: icon)
            : TextButton.icon(
                onPressed: Nav.cart,
                icon: icon,
                label: const Text('Cart'),
              ),
      );
    });
  }
}
