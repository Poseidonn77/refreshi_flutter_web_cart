import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../controller/payment_controller.dart';
import '../modules/ordered_cart_notice.dart';
import '../modules/responsive.dart';
import '../../app/nav.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const double _maxWidth = 640;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PaymentController>(tag: routeIdOf(context));
    final textTheme = Theme.of(context).textTheme;
    final id = controller.routeId;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text('Checkout #$id'),
      ),
      body: Obx(() {
        if (!controller.cart.isCurrent(id)) return OrderedCartNotice(id: id);
        if (controller.cart.count == 0) {
          return const Center(child: Text('Your cart is empty'));
        }
        return ListView(
          padding: context.pagePadding(
            maxWidth: _maxWidth,
            top: context.gutter,
            bottom: context.gutter,
          ),
          children: [
            Text(
              'Total: ${controller.formattedAmount}',
              style: context.isMobile
                  ? textTheme.headlineSmall
                  : textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'This amount is held on your card when you place the order '
              'and charged once it is confirmed.',
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            Text('Delivery time', style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final slot in controller.slots)
                  _SlotChip(
                    key: ValueKey(slot.label),
                    label: slot.label,
                    selected: controller.selectedSlot.value == slot,
                    onSelected: () => controller.selectSlot(slot),
                  ),
              ],
            ),
          ],
        );
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.gutter),
          child: MaxWidth(
            maxWidth: _maxWidth,
            child: Obx(() {
              if (!controller.isCheckoutable) return const SizedBox.shrink();
              final placing = controller.isPlacing.value;
              final error = controller.placeError.value;
              // Signing in is required to place an order.
              if (!controller.isSignedIn) {
                final hasSlot = controller.selectedSlot.value != null;
                return FilledButton.icon(
                  icon: const Icon(Icons.person),
                  label: Text(
                    hasSlot
                        ? 'Sign in & place order'
                        : 'Choose a delivery time',
                  ),
                  onPressed: hasSlot ? controller.signInAndPlaceOrder : null,
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        error,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  FilledButton.icon(
                    icon: placing
                        ? const SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.check),
                    label: Text(
                      placing
                          ? 'Placing order…'
                          : controller.selectedSlot.value == null
                          ? 'Choose a delivery time'
                          : 'Place order',
                    ),
                    onPressed: controller.canPlaceOrder
                        ? controller.placeOrder
                        : null,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// One delivery-slot chip. A single leading icon that swaps between a clock
/// and a check — no separate checkmark, so icons never stack or linger on a
/// chip that's no longer selected.
class _SlotChip extends StatelessWidget {
  const _SlotChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      showCheckmark: false,
      avatar: Icon(selected ? Icons.check_circle : Icons.schedule, size: 18),
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
    );
  }
}
