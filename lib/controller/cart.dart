import 'package:graphql_flutter/graphql_flutter.dart';

import '../database/models/cart.graphql.dart';

fuction hello() {
  final data = {};
  final parsedData = Query$FetchCart.
  final name = parsedData.fetchPerson?.name;
  print(name);
}
