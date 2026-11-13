/// Route names. Use these constants instead of raw strings, e.g.
/// `Get.toNamed(Routes.cartPath('42'))`. In the app, navigate via `Nav` (nav.dart).
abstract final class Routes {
  static const String landing = '/';
  static const String geoMerchants = '/geo_merchants';
  static const String cart = '/cart/:id';
  static const String details = '/details/:id';
  static const String signIn = '/sign_in';
  static const String order = '/order/:id';
  static const String checkout = '/checkout/:id';
  static const String orders = '/orders';

  static String cartPath(String id) => '/cart/$id';
  static String detailsPath(String id) => '/details/$id';
  static String orderPath(String id) => '/order/$id';
  static String checkoutPath(String id) => '/checkout/$id';

  /// Sign-in that continues to [next] when done (used by AuthGuard).
  static String signInThen(String next) =>
      Uri(path: signIn, queryParameters: {'next': next}).toString();
}
