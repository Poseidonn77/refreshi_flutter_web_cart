import 'package:material_ui/material_ui.dart';

import '../../controller/order_controller.dart';

/// Shows whether the order's payment is unpaid, on hold, or paid.
class PaymentStatusTile extends StatelessWidget {
  const PaymentStatusTile({super.key, required this.status, this.amount});

  final PaymentStatus status;

  /// Formatted amount, e.g. `14.50`.
  final String? amount;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (
      Widget icon,
      String label,
      String detail,
      Color color,
    ) = switch (status) {
      PaymentStatus.paid => (
        const Icon(Icons.check_circle),
        'Paid',
        'Payment captured',
        Colors.green.shade700,
      ),
      PaymentStatus.onHold => (
        const SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(strokeWidth: 2.5),
        ),
        'On hold',
        'Amount reserved, confirming payment…',
        scheme.tertiary,
      ),
      PaymentStatus.unpaid => (
        const Icon(Icons.credit_card_off_outlined),
        'Not paid',
        'No payment hold yet',
        scheme.outline,
      ),
    };
    return ListTile(
      leading: IconTheme.merge(
        data: IconThemeData(color: color),
        child: icon,
      ),
      title: const Text('Payment'),
      subtitle: Text(detail),
      trailing: Chip(
        key: Key('payment-${status.name}'),
        label: Text(amount == null ? label : '$label · $amount'),
        labelStyle: TextStyle(color: color, fontWeight: FontWeight.w600),
        side: BorderSide(color: color),
      ),
    );
  }
}
