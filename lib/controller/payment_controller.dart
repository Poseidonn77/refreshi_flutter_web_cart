import '../database/queries/fetch_pay.graphql.dart';
import 'base_query_controller.dart';

class PaymentController extends BaseQueryController<Query$FetchPay$fetchPay> {
  PaymentController({super.client});

  @override
  void onInit() {
    super.onInit();
    if (routeId.isNotEmpty) fetchPay(routeId);
  }

  Future<void> fetchPay(String id) => run(
    () => client.query$FetchPay(
      Options$Query$FetchPay(variables: Variables$Query$FetchPay(id: id)),
    ),
    (parsed) => parsed.fetchPay,
  );

  /// Amount formatted for display, e.g. `12.50`.
  String get formattedAmount {
    final cents = data.value?.amountInCents;
    return cents == null ? '-' : (cents / 100).toStringAsFixed(2);
  }

  // TODO: holdPayment / capturePayment mutations.
}
