import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../services/graphql_service.dart';

/// Shared loading/error handling for controllers that run a single GraphQL
/// query. Pass [client] in tests; otherwise the app-wide one is used.
abstract class BaseQueryController<T> extends GetxController {
  BaseQueryController({GraphQLClient? client})
    : client = client ?? Get.find<GraphQLService>().client;

  final GraphQLClient client;

  final Rxn<T> data = Rxn<T>();
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  /// The `:id` segment of the current route.
  String get routeId => Get.parameters['id'] ?? '';

  /// Executes the query, maps the parsed result, updates state.
  Future<void> run<R>(
    Future<QueryResult<R>> Function() query,
    T? Function(R parsed) select,
  ) async {
    isLoading.value = true;
    error.value = null;
    try {
      final result = await query();
      if (result.hasException) {
        error.value = result.exception.toString();
      } else if (result.parsedData case final parsed?) {
        data.value = select(parsed);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
