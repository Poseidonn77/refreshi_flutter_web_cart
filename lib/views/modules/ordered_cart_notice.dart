import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';

/// Shown on `/cart/:id` or `/checkout/:id` when [id] isn't the cart being
/// filled (it was already ordered, or never existed). The current cart is
/// reached through the app-bar cart button.
class OrderedCartNotice extends StatelessWidget {
  const OrderedCartNotice({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Cart #$id is not your current cart.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.receipt_long),
              label: Text('View order #$id'),
              onPressed: () => Nav.replaceWithOrder(id),
            ),
          ],
        ),
      ),
    );
  }
}
