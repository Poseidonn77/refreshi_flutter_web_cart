import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/nav.dart';
import '../../controller/order_controller.dart';
import '../../models/product.dart';
import '../modules/cart_item.dart';
import '../modules/date_format.dart';
import '../modules/order_status_chip.dart';
import '../modules/payment_status.dart';
import '../modules/query_state_view.dart';
import '../modules/responsive.dart';
import '../modules/time_slot.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderController>(tag: routeIdOf(context));
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text('Order #${controller.routeId}'),
        actions: [
          IconButton(
            tooltip: 'All orders',
            icon: const Icon(Icons.receipt_long),
            onPressed: Nav.orders,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: QueryStateView(
        controller: controller,
        onRetry: () => controller.fetchOrder(controller.routeId),
        builder: (order) {
          final slot = controller.slotFor(order);
          final cents = order.pay?.amountInCents;
          return ListView(
            padding: context.pagePadding(maxWidth: 720, flush: true, top: 8),
            children: [
              ListTile(
                leading: const Icon(Icons.receipt_long),
                title: const Text('Status'),
                subtitle: Text('Placed ${formatDateTime(order.dateOfOrder)}'),
                trailing: OrderStatusChip(status: order.status),
              ),
              PaymentStatusTile(
                status: controller.paymentStatus,
                amount: cents == null ? null : Product.formatCents(cents),
              ),
              TimeSlot(start: slot?.start, end: slot?.end),
              const Divider(),
              for (final item in order.cart?.items ?? const <String>[])
                CartItem(name: item),
            ],
          );
        },
      ),
    );
  }
}
