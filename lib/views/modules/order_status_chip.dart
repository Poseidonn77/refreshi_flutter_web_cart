import 'package:material_ui/material_ui.dart';

import '../../models/order_status.dart';

/// Coloured chip for an order's status.
class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (IconData icon, Color color) = switch (status) {
      OrderStatus.PLACED => (Icons.hourglass_top, scheme.tertiary),
      OrderStatus.CONFIRMED => (Icons.check_circle_outline, scheme.primary),
      OrderStatus.OUT_FOR_DELIVERY => (
        Icons.delivery_dining,
        Colors.orange.shade800,
      ),
      OrderStatus.DELIVERED => (Icons.done_all, Colors.green.shade700),
      OrderStatus.$unknown => (Icons.help_outline, scheme.outline),
    };
    return Chip(
      key: Key('status-${status.name}'),
      avatar: Icon(icon, size: 18, color: color),
      label: Text(status.label),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.w600),
      side: BorderSide(color: color),
      visualDensity: VisualDensity.compact,
    );
  }
}
