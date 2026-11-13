import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/order_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/sign_in_controller.dart';
import '../views/pages/cart_page.dart';
import '../views/pages/checkout_page.dart';
import '../views/pages/details_page.dart';
import '../views/pages/geo_merchants_page.dart';
import '../views/pages/landing_page.dart';
import '../views/pages/order_page.dart';
import '../views/pages/sign_in_page.dart';
import 'app_routes.dart';

/// Every route, with the controller it needs injected via a binding.
/// Controllers are created on navigation and disposed when the route pops.
abstract final class AppPages {
  static const String initial = Routes.landing;

  static final List<GetPage<dynamic>> pages = [
    GetPage(name: Routes.landing, page: () => const LandingPage()),
    GetPage(name: Routes.geoMerchants, page: () => const GeoMerchantsPage()),
    GetPage(name: Routes.details, page: () => const DetailsPage()),
    GetPage(
      name: Routes.cart,
      page: () => const CartPage(),
      binding: BindingsBuilder.put(() => CartController()),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutPage(),
      binding: BindingsBuilder.put(() => PaymentController()),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
      binding: BindingsBuilder.put(() => OrderController()),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInPage(),
      binding: BindingsBuilder.put(() => SignInController()),
    ),
  ];
}
