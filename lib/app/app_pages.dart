import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../controller/orders_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/sign_in_controller.dart';
import '../views/pages/cart_page.dart';
import '../views/pages/checkout_page.dart';
import '../views/pages/details_page.dart';
import '../views/pages/geo_merchants_page.dart';
import '../views/pages/landing_page.dart';
import '../views/pages/order_page.dart';
import '../views/pages/orders_page.dart';
import '../views/pages/sign_in_page.dart';
import 'app_routes.dart';
import 'auth_guard.dart';

/// Every route, with the controller it needs injected via a binding.
/// Controllers are created on navigation and disposed when the route pops.
///
/// Per-id pages (`/order/:id`, `/checkout/:id`) tag their controller with the
/// id, so `/order/2` and `/order/1` (e.g. after editing the URL) each get
/// their own controller and data. `Get.put` would otherwise hand the new page
/// the existing, untagged instance. Pages look it up with
/// `Get.find(tag: routeIdOf(context))`.
abstract final class AppPages {
  static const String initial = Routes.landing;

  static final List<GetPage<dynamic>> pages = [
    GetPage(name: Routes.landing, page: () => const LandingPage()),
    GetPage(name: Routes.geoMerchants, page: () => const GeoMerchantsPage()),
    GetPage(name: Routes.details, page: () => const DetailsPage()),
    // Cart contents come from the app-wide CartService (local, Hive-backed).
    GetPage(name: Routes.cart, page: () => const CartPage()),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutPage(),
      binding: BindingsBuilder<void>(() {
        Get.put(PaymentController(), tag: _routeId);
      }),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
      middlewares: [AuthGuard()],
      binding: BindingsBuilder<void>(() {
        Get.put(OrderController(), tag: _routeId);
      }),
    ),
    GetPage(
      name: Routes.orders,
      page: () => const OrdersPage(),
      middlewares: [AuthGuard()],
      binding: BindingsBuilder.put(() => OrdersController()),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInPage(),
      binding: BindingsBuilder.put(() => SignInController()),
    ),
  ];
}

/// The `:id` of the route being bound (valid while its binding runs).
String get _routeId => Get.parameters['id'] ?? '';
