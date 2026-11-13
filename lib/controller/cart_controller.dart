import '../database/queries/fetch_cart.graphql.dart';
import 'base_query_controller.dart';

class CartController extends BaseQueryController<Query$FetchCart$fetchCart> {
  CartController({super.client});

  @override
  void onInit() {
    super.onInit();
    if (routeId.isNotEmpty) fetchCart(routeId);
  }

  Future<void> fetchCart(String id) => run(
    () => client.query$FetchCart(
      Options$Query$FetchCart(variables: Variables$Query$FetchCart(id: id)),
    ),
    (parsed) => parsed.fetchCart,
  );

  // TODO: addItem / removeItem mutations once the schema exposes them.
}
