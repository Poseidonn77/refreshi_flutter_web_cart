import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// App-wide GraphQL client, registered once in `main()` via `Get.putAsync`.
///
/// Override the endpoint at build/run time:
///   flutter run -d chrome --dart-define=GRAPHQL_ENDPOINT=https://api.example.com/graphql
class GraphQLService extends GetxService {
  /// Pass a [client] to bypass the HTTP link (tests, mocks).
  GraphQLService([this._client]);

  static const String endpoint = String.fromEnvironment(
    'GRAPHQL_ENDPOINT',
    defaultValue: 'http://localhost:4000/graphql',
  );

  GraphQLClient? _client;
  GraphQLClient get client => _client!;

  Future<GraphQLService> init() async {
    // Opens the Hive-backed cache box (IndexedDB on web).
    await initHiveForFlutter();
    _client ??= GraphQLClient(
      link: HttpLink(endpoint),
      cache: GraphQLCache(store: HiveStore()),
    );
    return this;
  }
}
