import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../controller/order_controller.dart';
import '../modules/cart_item.dart';
import '../modules/query_state_view.dart';
import '../modules/time_slot.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order ${controller.routeId}')),
      body: QueryStateView(
        controller: controller,
        onRetry: () => controller.fetchOrder(controller.routeId),
        builder: (order) => ListView(
          children: [
            TimeSlot(start: order.timeSlotStart, end: order.timeSlotEnd),
            const Divider(),
            for (final item in order.cart?.items ?? const <String>[])
              CartItem(name: item),
          ],
        ),
      ),
    );
  }
}
