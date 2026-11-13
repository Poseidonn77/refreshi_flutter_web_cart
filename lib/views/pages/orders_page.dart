import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';
import '../../controller/orders_controller.dart';
import '../../models/product.dart';
import '../modules/date_format.dart';
import '../modules/order_status_chip.dart';
import '../modules/query_state_view.dart';
import '../modules/responsive.dart';

/// `/orders`: order history, newest first, each with its status.
class OrdersPage extends GetView<OrdersController> {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Orders'),
      ),
      body: QueryStateView(
        controller: controller,
        onRetry: controller.fetchOrders,
        builder: (orders) {
          if (orders.isEmpty) {
            return const Center(child: Text('No orders yet'));
          }
          return RefreshIndicator(
            onRefresh: () => controller.fetchOrders(silent: true),
            child: ListView.separated(
              padding: context.pagePadding(maxWidth: 840, flush: true, top: 8),
              itemCount: orders.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (_, i) => _OrderRow(order: orders[i]),
            ),
          );
        },
      ),
    );
  }
}

class _OrderRow extends StatelessWidget {
  const _OrderRow({required this.order});

  final OrderSummary order;

  @override
  Widget build(BuildContext context) {
    final items = order.cart?.items ?? const <String>[];
    final cents = order.pay?.amountInCents;
    final summary = [
      formatDateTime(order.dateOfOrder),
      '${items.length} item${items.length == 1 ? '' : 's'}',
      if (cents != null) Product.formatCents(cents),
    ].join(' · ');
    final chip = OrderStatusChip(status: order.status);
    // On mobile the chip goes under the text so the row doesn't overflow.
    return ListTile(
      key: Key('order-${order.id}'),
      leading: const Icon(Icons.receipt_long),
      title: Text('Order #${order.id}'),
      subtitle: context.isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(summary), const SizedBox(height: 4), chip],
            )
          : Text(summary),
      trailing: context.isMobile
          ? const Icon(Icons.chevron_right)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [chip, const Icon(Icons.chevron_right)],
            ),
      onTap: () => Nav.order(order.id),
    );
  }
}
