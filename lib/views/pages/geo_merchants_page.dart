import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';
import '../modules/responsive.dart';

class GeoMerchantsPage extends StatelessWidget {
  const GeoMerchantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: replace with merchants from a GeoMerchantsController.
    const merchantIds = ['1', '2', '3'];
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Merchants near me'),
      ),
      body: ListView(
        padding: context.pagePadding(maxWidth: 720, flush: true),
        children: [
          for (final id in merchantIds)
            ListTile(
              leading: const Icon(Icons.storefront),
              title: Text('Merchant $id'),
              onTap: () => Nav.merchant(id),
            ),
        ],
      ),
    );
  }
}
