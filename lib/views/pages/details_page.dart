import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = routeIdOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text('Merchant $id'),
      ),
      body: const Center(child: Text('Catalog goes here')),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.shopping_cart),
        label: const Text('View cart'),
        onPressed: Nav.cart,
      ),
    );
  }
}
