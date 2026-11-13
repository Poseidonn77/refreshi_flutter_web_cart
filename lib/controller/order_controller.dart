import '../database/queries/fetch_order.graphql.dart';
import 'base_query_controller.dart';

class OrderController extends BaseQueryController<Query$FetchOrder$fetchOrder> {
  OrderController({super.client});

  @override
  void onInit() {
    super.onInit();
    if (routeId.isNotEmpty) fetchOrder(routeId);
  }

  Future<void> fetchOrder(String id) => run(
    () => client.query$FetchOrder(
      Options$Query$FetchOrder(variables: Variables$Query$FetchOrder(id: id)),
    ),
    (parsed) => parsed.fetchOrder,
  );
}
