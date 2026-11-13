import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../controller/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Obx(() => Text('Signing in… ${controller.secondsLeft.value}s')),
          ],
        ),
      ),
    );
  }
}
