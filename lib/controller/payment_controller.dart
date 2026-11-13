import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../app/nav.dart';
import '../database/queries/place_order.graphql.dart';
import '../database/schema.graphql.dart';
import '../models/delivery_slot.dart';
import '../models/product.dart';
import '../services/cart_service.dart';
import '../services/graphql_service.dart';
import 'base_query_controller.dart';
import 'sign_in_controller.dart';

/// `/checkout/:id`: pick a delivery slot and place order `:id` (the current
/// cart's id). Placing creates the order and holds the payment on the server.
class PaymentController extends GetxController {
  PaymentController({GraphQLClient? client, DateTime Function()? clock})
    : client = client ?? Get.find<GraphQLService>().client,
      _clock = clock ?? DateTime.now;

  final GraphQLClient client;
  final DateTime Function() _clock;

  CartService get cart => Get.find<CartService>();

  /// Captured when the route opens; see BaseQueryController.routeId.
  final String routeId = Get.parameters['id'] ?? '';

  /// Fixed delivery windows for today (19:00–20:00, 20:00–21:00, 21:00–22:00).
  late final List<DeliverySlot> slots = DeliverySlot.fixedFor(_clock());
  final Rxn<DeliverySlot> selectedSlot = Rxn<DeliverySlot>();

  final RxBool isPlacing = false.obs;
  final RxnString placeError = RxnString();

  /// The route is the cart being filled, and it has something in it.
  bool get isCheckoutable => cart.isCurrent(routeId) && cart.count > 0;

  bool get isSignedIn => SignInController.isSignedIn.value;

  bool get canPlaceOrder =>
      isSignedIn &&
      isCheckoutable &&
      selectedSlot.value != null &&
      !isPlacing.value;

  void selectSlot(DeliverySlot slot) => selectedSlot.value = slot;

  /// Amount formatted for display, e.g. `12.50`.
  String get formattedAmount => Product.formatCents(cart.totalInCents);

  /// Not signed in yet: run the timed sign-in, then place the order
  /// straight away (no second tap).
  Future<void> signInAndPlaceOrder() async {
    await Nav.signIn();
    if (canPlaceOrder) await placeOrder();
  }

  Future<void> placeOrder() async {
    final slot = selectedSlot.value;
    if (slot == null || !canPlaceOrder) return;
    isPlacing.value = true;
    placeError.value = null;
    try {
      final result = await client.mutate$PlaceOrder(
        Options$Mutation$PlaceOrder(
          variables: Variables$Mutation$PlaceOrder(
            input: Input$PlaceOrderInput(
              id: routeId,
              items: cart.itemLabels,
              amountInCents: cart.totalInCents,
              timeSlotStart: slot.start,
              timeSlotEnd: slot.end,
            ),
          ),
        ),
      );
      if (result.hasException) {
        placeError.value = BaseQueryController.describe(result.exception!);
        return;
      }
      final orderId = result.parsedData?.placeOrder?.id ?? routeId;
      cart.startNextCart();
      Nav.placedOrder(orderId);
    } catch (e) {
      placeError.value = e.toString();
    } finally {
      isPlacing.value = false;
    }
  }
}
