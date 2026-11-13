import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';
import '../../controller/sign_in_controller.dart';
import '../../models/product.dart';
import '../modules/account_button.dart';
import '../modules/cart_button.dart';
import '../modules/product_tile.dart';
import '../modules/responsive.dart';

/// Home: the merchant's catalog. App bar: orders (signed in only), cart
/// badge, account. A list on mobile; a 2/3-column grid on tablet/desktop.
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const products = Product.catalog;
    final padding = context.pagePadding(flush: true, top: 8, bottom: 24);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lovable Food'),
        actions: [
          Obx(
            () => SignInController.isSignedIn.value
                ? IconButton(
                    tooltip: 'My orders',
                    icon: const Icon(Icons.receipt_long),
                    onPressed: Nav.orders,
                  )
                : const SizedBox.shrink(),
          ),
          const CartButton(),
          const AccountButton(),
          const SizedBox(width: 8),
        ],
      ),
      body: context.isMobile
          ? ListView(
              padding: padding,
              children: [
                for (final product in products) ProductTile(product: product),
              ],
            )
          : GridView.builder(
              padding: padding,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.gridColumns,
                childAspectRatio: 0.82,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (_, i) => ProductCard(product: products[i]),
            ),
    );
  }
}
