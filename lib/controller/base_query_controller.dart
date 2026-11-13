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

  /// The `:id` segment of this controller's route, captured when the route
  /// opens. (`Get.parameters` is global and changes as other routes open,
  /// e.g. sign-in, so it must not be re-read later.)
  final String routeId = Get.parameters['id'] ?? '';

  /// Executes the query, maps the parsed result, updates state.
  /// With [silent], current data stays on screen (no spinner) while it runs.
  Future<void> run<R>(
    Future<QueryResult<R>> Function() query,
    T? Function(R parsed) select, {
    bool silent = false,
  }) async {
    if (!silent) isLoading.value = true;
    error.value = null;
    try {
      final result = await query();
      if (result.hasException) {
        error.value = describe(result.exception!);
      } else if (result.parsedData case final parsed?) {
        data.value = select(parsed);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Turns an [OperationException] into something readable in the UI.
  static String describe(OperationException e) {
    final link = e.linkException;
    if (link is ServerException && link.parsedResponse == null ||
        link is NetworkException) {
      return "Can't reach the GraphQL server at ${GraphQLService.endpoint}.\n"
          'Is it running, and does it allow CORS from this origin?';
    }
    if (e.graphqlErrors.isNotEmpty) {
      return e.graphqlErrors.map((err) => err.message).join('\n');
    }
    return link?.originalException?.toString() ?? e.toString();
  }
}
