import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/app_routes.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'] ?? '';
    return Scaffold(
      appBar: AppBar(title: Text('Merchant $id')),
      body: const Center(child: Text('Catalog goes here')),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.shopping_cart),
        label: const Text('View cart'),
        onPressed: () => Get.toNamed(Routes.cartPath(id)),
      ),
    );
  }
}
