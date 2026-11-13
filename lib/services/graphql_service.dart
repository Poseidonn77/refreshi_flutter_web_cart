import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_ce/hive.dart' as ce;

import '../database/demo_link.dart';

/// App-wide GraphQL client, registered once in `main()` via `Get.putAsync`.
///
/// With no endpoint defined the app runs against the offline [DemoLink].
/// To use a real server:
///   flutter run -d chrome --dart-define=GRAPHQL_ENDPOINT=http://localhost:4000/graphql
/// (The server must allow CORS from the app's origin.)
class GraphQLService extends GetxService {
  /// Pass a [client] to bypass the HTTP link (tests, mocks).
  GraphQLService([this._client]);

  static const String endpoint = String.fromEnvironment('GRAPHQL_ENDPOINT');
  static bool get isDemo => endpoint.isEmpty;

  GraphQLClient? _client;
  GraphQLClient get client => _client!;

  Future<GraphQLService> init() async {
    // Opens the Hive-backed cache box (IndexedDB on web).
    await initHiveForFlutter();
    // The demo "database" persists in its own Hive box (hive_ce, already
    // initialised by StorageService in main()).
    _client ??= GraphQLClient(
      link: isDemo
          ? DemoLink(box: await ce.Hive.openBox<dynamic>(DemoLink.boxName))
          : HttpLink(endpoint),
      cache: GraphQLCache(store: HiveStore()),
    );
    return this;
  }
}
