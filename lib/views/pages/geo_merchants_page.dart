import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/app_routes.dart';

class GeoMerchantsPage extends StatelessWidget {
  const GeoMerchantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: replace with merchants from a GeoMerchantsController.
    const merchantIds = ['1', '2', '3'];
    return Scaffold(
      appBar: AppBar(title: const Text('Merchants near me')),
      body: ListView(
        children: [
          for (final id in merchantIds)
            ListTile(
              leading: const Icon(Icons.storefront),
              title: Text('Merchant $id'),
              onTap: () => Get.toNamed(Routes.detailsPath(id)),
            ),
        ],
      ),
    );
  }
}
