import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/app_routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lovable Food')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Sign in',
        child: const Icon(Icons.person),
        onPressed: () => Get.toNamed(Routes.signIn),
      ),
      // Demo navigation hub; ids are placeholders until real data exists.
      body: ListView(
        children: [
          _NavTile('Merchants near me', Routes.geoMerchants),
          _NavTile('Merchant details #1', Routes.detailsPath('1')),
          _NavTile('Cart #1', Routes.cartPath('1')),
          _NavTile('Checkout #1', Routes.checkoutPath('1')),
          _NavTile('Order #1', Routes.orderPath('1')),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile(this.label, this.route);

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Get.toNamed(route),
    );
  }
}
