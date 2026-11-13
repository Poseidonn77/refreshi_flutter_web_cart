import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/app_routes.dart';
import '../../controller/payment_controller.dart';
import '../modules/query_state_view.dart';

class CheckoutPage extends GetView<PaymentController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: QueryStateView(
        controller: controller,
        onRetry: () => controller.fetchPay(controller.routeId),
        builder: (_) => Center(
          child: Text(
            'Total: ${controller.formattedAmount}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        label: const Text('Place order'),
        onPressed: () => Get.offNamed(Routes.orderPath(controller.routeId)),
      ),
    );
  }
}
