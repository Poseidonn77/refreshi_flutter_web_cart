import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../controller/sign_in_controller.dart';
import 'app_routes.dart';

/// Pages for signed-in users only (orders, an order). Signed out, the route
/// becomes the timed sign-in, which then continues to the requested page.
class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (SignInController.isSignedIn.value) return null;
    return RouteSettings(name: Routes.signInThen(route ?? Routes.landing));
  }
}
