import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../services/cart_service.dart';
import 'app_routes.dart';

/// All navigation goes through here so the back stack stays shallow and
/// predictable app-wide. Home (`/`) is always the root:
///
///   /                          home (catalog)
///   / > cart > checkout        checkout steps stack on the cart
///   / > orders > order         an order opened from history
///   / > order                  right after placing an order
///   / > sign_in                temporary; pops back where it came from
///
/// Cart and Orders are top-level: opening them from anywhere clears back
/// to home first, so pages never pile up.
abstract final class Nav {
  static bool _isHome(Route<dynamic> r) => r.settings.name == Routes.landing;

  static void home() => Get.offAllNamed(Routes.landing);

  /// Back one step, or home when there's nothing behind (deep link/reload).
  static void back(BuildContext context) =>
      Navigator.of(context).canPop() ? Get.back<void>() : home();

  /// Opens a top-level page directly above home.
  static void _top(String route) => Get.offNamedUntil(route, _isHome);

  static void cart() =>
      _top(Routes.cartPath(Get.find<CartService>().cartId.value));
  static void orders() => _top(Routes.orders);

  /// From the cart.
  static void checkout(String id) => Get.toNamed(Routes.checkoutPath(id));

  /// An order from the history list (back returns to the list).
  static void order(String id) => Get.toNamed(Routes.orderPath(id));

  /// The order just placed: replaces cart/checkout, back goes home.
  static void placedOrder(String id) => _top(Routes.orderPath(id));

  /// The order a stale cart/checkout URL became.
  static void replaceWithOrder(String id) => Get.offNamed(Routes.orderPath(id));

  /// Timed demo sign-in; completes when it returns to the current page.
  static Future<void> signIn() async => Get.toNamed<void>(Routes.signIn);

  static void merchant(String id) => Get.toNamed(Routes.detailsPath(id));

  /// A URL typed/edited in the browser: replace the current page instead of
  /// stacking a new one, keeping the same shape as in-app navigation.
  static void openUrl(String location) {
    final path = Uri.parse(location).path;
    if (path.isEmpty || path == Routes.landing) return home();
    if (path == Routes.orders || path.startsWith('/cart/')) {
      return _top(location);
    }
    Get.offNamed<void>(location);
  }
}

/// Handles browser URL edits before the app's default handler (which would
/// push a new page). Register it before `runApp` so it's asked first:
/// `WidgetsBinding.instance.addObserver(UrlReplaceObserver())`.
class UrlReplaceObserver with WidgetsBindingObserver {
  @override
  Future<bool> didPushRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;
    final location = uri.path.isEmpty ? Routes.landing : uri.toString();
    if (location != Get.currentRoute) Nav.openUrl(location);
    return true; // handled: don't let the default push a new page
  }
}

/// App-bar back button for every non-root page; see [Nav.back].
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BackButton(onPressed: () => Nav.back(context));
}

/// The `:id` of the route [context] is on, e.g. `3` for `/cart/3`.
/// Use this in widgets instead of `Get.parameters`, which is global and
/// changes when another route (like sign-in) opens on top.
String routeIdOf(BuildContext context) {
  final name = ModalRoute.of(context)?.settings.name;
  final segments = name == null
      ? const <String>[]
      : Uri.parse(name).pathSegments;
  return segments.length >= 2 ? segments.last : (Get.parameters['id'] ?? '');
}
