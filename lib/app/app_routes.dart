/// Route names. Use these constants instead of raw strings, e.g.
/// `Get.toNamed(Routes.cartPath('42'))`.
abstract final class Routes {
  static const String landing = '/';
  static const String geoMerchants = '/geo_merchants';
  static const String cart = '/cart/:id';
  static const String details = '/details/:id';
  static const String signIn = '/sign_in';
  static const String order = '/order/:id';
  static const String checkout = '/checkout/:id';

  static String cartPath(String id) => '/cart/$id';
  static String detailsPath(String id) => '/details/$id';
  static String orderPath(String id) => '/order/$id';
  static String checkoutPath(String id) => '/checkout/$id';
}
