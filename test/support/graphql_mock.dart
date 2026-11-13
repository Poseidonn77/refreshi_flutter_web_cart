import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// Answers every operation with canned JSON keyed by operation name.
class MockLink extends Link {
  MockLink(this.responses);

  final Map<String, Map<String, dynamic>> responses;
  final List<Request> requests = [];

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    requests.add(request);
    final name =
        request.operation.operationName ??
        request.operation.document.definitions
            .whereType<OperationDefinitionNode>()
            .first
            .name!
            .value;
    final data = responses[name];
    if (data == null) {
      return Stream.value(
        Response(
          errors: [GraphQLError(message: 'No mock for $name')],
          response: const {},
        ),
      );
    }
    return Stream.value(Response(data: data, response: {'data': data}));
  }
}

GraphQLClient clientFor(MockLink link) => GraphQLClient(
  link: link,
  cache: GraphQLCache(store: InMemoryStore()),
  defaultPolicies: DefaultPolicies(
    query: Policies(fetch: FetchPolicy.networkOnly),
  ),
);
