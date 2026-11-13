import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../controller/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Signing in…'),
          ],
        ),
      ),
    );
  }
}
