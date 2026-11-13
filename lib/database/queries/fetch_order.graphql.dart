import 'dart:async';

import 'package:flutter_webview_cart/database/scalars.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$FetchOrder {
  factory Variables$Query$FetchOrder({required String id}) =>
      Variables$Query$FetchOrder._({r'id': id});

  Variables$Query$FetchOrder._(this._$data);

  factory Variables$Query$FetchOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$FetchOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$FetchOrder<Variables$Query$FetchOrder>
  get copyWith => CopyWith$Variables$Query$FetchOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$FetchOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$FetchOrder<TRes> {
  factory CopyWith$Variables$Query$FetchOrder(
    Variables$Query$FetchOrder instance,
    TRes Function(Variables$Query$FetchOrder) then,
  ) = _CopyWithImpl$Variables$Query$FetchOrder;

  factory CopyWith$Variables$Query$FetchOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchOrder;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$FetchOrder<TRes>
    implements CopyWith$Variables$Query$FetchOrder<TRes> {
  _CopyWithImpl$Variables$Query$FetchOrder(this._instance, this._then);

  final Variables$Query$FetchOrder _instance;

  final TRes Function(Variables$Query$FetchOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$FetchOrder._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$FetchOrder<TRes>
    implements CopyWith$Variables$Query$FetchOrder<TRes> {
  _CopyWithStubImpl$Variables$Query$FetchOrder(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$FetchOrder {
  Query$FetchOrder({this.fetchOrder, this.$__typename = 'Query'});

  factory Query$FetchOrder.fromJson(Map<String, dynamic> json) {
    final l$fetchOrder = json['fetchOrder'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrder(
      fetchOrder: l$fetchOrder == null
          ? null
          : Query$FetchOrder$fetchOrder.fromJson(
              (l$fetchOrder as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchOrder$fetchOrder? fetchOrder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$fetchOrder = fetchOrder;
    _resultData['fetchOrder'] = l$fetchOrder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$fetchOrder = fetchOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$fetchOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$fetchOrder = fetchOrder;
    final lOther$fetchOrder = other.fetchOrder;
    if (l$fetchOrder != lOther$fetchOrder) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchOrder on Query$FetchOrder {
  CopyWith$Query$FetchOrder<Query$FetchOrder> get copyWith =>
      CopyWith$Query$FetchOrder(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrder<TRes> {
  factory CopyWith$Query$FetchOrder(
    Query$FetchOrder instance,
    TRes Function(Query$FetchOrder) then,
  ) = _CopyWithImpl$Query$FetchOrder;

  factory CopyWith$Query$FetchOrder.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrder;

  TRes call({Query$FetchOrder$fetchOrder? fetchOrder, String? $__typename});
  CopyWith$Query$FetchOrder$fetchOrder<TRes> get fetchOrder;
}

class _CopyWithImpl$Query$FetchOrder<TRes>
    implements CopyWith$Query$FetchOrder<TRes> {
  _CopyWithImpl$Query$FetchOrder(this._instance, this._then);

  final Query$FetchOrder _instance;

  final TRes Function(Query$FetchOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fetchOrder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrder(
      fetchOrder: fetchOrder == _undefined
          ? _instance.fetchOrder
          : (fetchOrder as Query$FetchOrder$fetchOrder?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FetchOrder$fetchOrder<TRes> get fetchOrder {
    final local$fetchOrder = _instance.fetchOrder;
    return local$fetchOrder == null
        ? CopyWith$Query$FetchOrder$fetchOrder.stub(_then(_instance))
        : CopyWith$Query$FetchOrder$fetchOrder(
            local$fetchOrder,
            (e) => call(fetchOrder: e),
          );
  }
}

class _CopyWithStubImpl$Query$FetchOrder<TRes>
    implements CopyWith$Query$FetchOrder<TRes> {
  _CopyWithStubImpl$Query$FetchOrder(this._res);

  TRes _res;

  call({Query$FetchOrder$fetchOrder? fetchOrder, String? $__typename}) => _res;

  CopyWith$Query$FetchOrder$fetchOrder<TRes> get fetchOrder =>
      CopyWith$Query$FetchOrder$fetchOrder.stub(_res);
}

const documentNodeQueryFetchOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'fetchOrder'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dateOfOrder'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'timeSlotStart'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'timeSlotEnd'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cart'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'items'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'lastUpdated'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'pay'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'amountInCents'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'holdRequestTime'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'payCaptureTime'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$FetchOrder _parserFn$Query$FetchOrder(Map<String, dynamic> data) =>
    Query$FetchOrder.fromJson(data);
typedef OnQueryComplete$Query$FetchOrder = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FetchOrder?,
);

class Options$Query$FetchOrder extends graphql.QueryOptions<Query$FetchOrder> {
  Options$Query$FetchOrder({
    String? operationName,
    required Variables$Query$FetchOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchOrder? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FetchOrder? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$FetchOrder(data),
               ),
         onError: onError,
         document: documentNodeQueryFetchOrder,
         parserFn: _parserFn$Query$FetchOrder,
       );

  final OnQueryComplete$Query$FetchOrder? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FetchOrder
    extends graphql.WatchQueryOptions<Query$FetchOrder> {
  WatchOptions$Query$FetchOrder({
    String? operationName,
    required Variables$Query$FetchOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchOrder? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryFetchOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FetchOrder,
       );
}

class FetchMoreOptions$Query$FetchOrder extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchOrder({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FetchOrder variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryFetchOrder,
       );
}

extension ClientExtension$Query$FetchOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchOrder>> query$FetchOrder(
    Options$Query$FetchOrder options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$FetchOrder> watchQuery$FetchOrder(
    WatchOptions$Query$FetchOrder options,
  ) => this.watchQuery(options);

  void writeQuery$FetchOrder({
    required Query$FetchOrder data,
    required Variables$Query$FetchOrder variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFetchOrder),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FetchOrder? readQuery$FetchOrder({
    required Variables$Query$FetchOrder variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFetchOrder),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FetchOrder.fromJson(result);
  }
}

class Query$FetchOrder$fetchOrder {
  Query$FetchOrder$fetchOrder({
    required this.id,
    this.dateOfOrder,
    this.timeSlotStart,
    this.timeSlotEnd,
    this.cart,
    this.pay,
    this.$__typename = 'Order',
  });

  factory Query$FetchOrder$fetchOrder.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$dateOfOrder = json['dateOfOrder'];
    final l$timeSlotStart = json['timeSlotStart'];
    final l$timeSlotEnd = json['timeSlotEnd'];
    final l$cart = json['cart'];
    final l$pay = json['pay'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrder$fetchOrder(
      id: (l$id as String),
      dateOfOrder: l$dateOfOrder == null
          ? null
          : fromJsonIsoDateTime(l$dateOfOrder),
      timeSlotStart: l$timeSlotStart == null
          ? null
          : fromJsonIsoDateTime(l$timeSlotStart),
      timeSlotEnd: l$timeSlotEnd == null
          ? null
          : fromJsonIsoDateTime(l$timeSlotEnd),
      cart: l$cart == null
          ? null
          : Query$FetchOrder$fetchOrder$cart.fromJson(
              (l$cart as Map<String, dynamic>),
            ),
      pay: l$pay == null
          ? null
          : Query$FetchOrder$fetchOrder$pay.fromJson(
              (l$pay as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime? dateOfOrder;

  final DateTime? timeSlotStart;

  final DateTime? timeSlotEnd;

  final Query$FetchOrder$fetchOrder$cart? cart;

  final Query$FetchOrder$fetchOrder$pay? pay;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$dateOfOrder = dateOfOrder;
    _resultData['dateOfOrder'] = l$dateOfOrder == null
        ? null
        : toJsonIsoDateTime(l$dateOfOrder);
    final l$timeSlotStart = timeSlotStart;
    _resultData['timeSlotStart'] = l$timeSlotStart == null
        ? null
        : toJsonIsoDateTime(l$timeSlotStart);
    final l$timeSlotEnd = timeSlotEnd;
    _resultData['timeSlotEnd'] = l$timeSlotEnd == null
        ? null
        : toJsonIsoDateTime(l$timeSlotEnd);
    final l$cart = cart;
    _resultData['cart'] = l$cart?.toJson();
    final l$pay = pay;
    _resultData['pay'] = l$pay?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$dateOfOrder = dateOfOrder;
    final l$timeSlotStart = timeSlotStart;
    final l$timeSlotEnd = timeSlotEnd;
    final l$cart = cart;
    final l$pay = pay;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$dateOfOrder,
      l$timeSlotStart,
      l$timeSlotEnd,
      l$cart,
      l$pay,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchOrder$fetchOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$dateOfOrder = dateOfOrder;
    final lOther$dateOfOrder = other.dateOfOrder;
    if (l$dateOfOrder != lOther$dateOfOrder) {
      return false;
    }
    final l$timeSlotStart = timeSlotStart;
    final lOther$timeSlotStart = other.timeSlotStart;
    if (l$timeSlotStart != lOther$timeSlotStart) {
      return false;
    }
    final l$timeSlotEnd = timeSlotEnd;
    final lOther$timeSlotEnd = other.timeSlotEnd;
    if (l$timeSlotEnd != lOther$timeSlotEnd) {
      return false;
    }
    final l$cart = cart;
    final lOther$cart = other.cart;
    if (l$cart != lOther$cart) {
      return false;
    }
    final l$pay = pay;
    final lOther$pay = other.pay;
    if (l$pay != lOther$pay) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchOrder$fetchOrder
    on Query$FetchOrder$fetchOrder {
  CopyWith$Query$FetchOrder$fetchOrder<Query$FetchOrder$fetchOrder>
  get copyWith => CopyWith$Query$FetchOrder$fetchOrder(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrder$fetchOrder<TRes> {
  factory CopyWith$Query$FetchOrder$fetchOrder(
    Query$FetchOrder$fetchOrder instance,
    TRes Function(Query$FetchOrder$fetchOrder) then,
  ) = _CopyWithImpl$Query$FetchOrder$fetchOrder;

  factory CopyWith$Query$FetchOrder$fetchOrder.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrder$fetchOrder;

  TRes call({
    String? id,
    DateTime? dateOfOrder,
    DateTime? timeSlotStart,
    DateTime? timeSlotEnd,
    Query$FetchOrder$fetchOrder$cart? cart,
    Query$FetchOrder$fetchOrder$pay? pay,
    String? $__typename,
  });
  CopyWith$Query$FetchOrder$fetchOrder$cart<TRes> get cart;
  CopyWith$Query$FetchOrder$fetchOrder$pay<TRes> get pay;
}

class _CopyWithImpl$Query$FetchOrder$fetchOrder<TRes>
    implements CopyWith$Query$FetchOrder$fetchOrder<TRes> {
  _CopyWithImpl$Query$FetchOrder$fetchOrder(this._instance, this._then);

  final Query$FetchOrder$fetchOrder _instance;

  final TRes Function(Query$FetchOrder$fetchOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? dateOfOrder = _undefined,
    Object? timeSlotStart = _undefined,
    Object? timeSlotEnd = _undefined,
    Object? cart = _undefined,
    Object? pay = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrder$fetchOrder(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      dateOfOrder: dateOfOrder == _undefined
          ? _instance.dateOfOrder
          : (dateOfOrder as DateTime?),
      timeSlotStart: timeSlotStart == _undefined
          ? _instance.timeSlotStart
          : (timeSlotStart as DateTime?),
      timeSlotEnd: timeSlotEnd == _undefined
          ? _instance.timeSlotEnd
          : (timeSlotEnd as DateTime?),
      cart: cart == _undefined
          ? _instance.cart
          : (cart as Query$FetchOrder$fetchOrder$cart?),
      pay: pay == _undefined
          ? _instance.pay
          : (pay as Query$FetchOrder$fetchOrder$pay?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FetchOrder$fetchOrder$cart<TRes> get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Query$FetchOrder$fetchOrder$cart.stub(_then(_instance))
        : CopyWith$Query$FetchOrder$fetchOrder$cart(
            local$cart,
            (e) => call(cart: e),
          );
  }

  CopyWith$Query$FetchOrder$fetchOrder$pay<TRes> get pay {
    final local$pay = _instance.pay;
    return local$pay == null
        ? CopyWith$Query$FetchOrder$fetchOrder$pay.stub(_then(_instance))
        : CopyWith$Query$FetchOrder$fetchOrder$pay(
            local$pay,
            (e) => call(pay: e),
          );
  }
}

class _CopyWithStubImpl$Query$FetchOrder$fetchOrder<TRes>
    implements CopyWith$Query$FetchOrder$fetchOrder<TRes> {
  _CopyWithStubImpl$Query$FetchOrder$fetchOrder(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? dateOfOrder,
    DateTime? timeSlotStart,
    DateTime? timeSlotEnd,
    Query$FetchOrder$fetchOrder$cart? cart,
    Query$FetchOrder$fetchOrder$pay? pay,
    String? $__typename,
  }) => _res;

  CopyWith$Query$FetchOrder$fetchOrder$cart<TRes> get cart =>
      CopyWith$Query$FetchOrder$fetchOrder$cart.stub(_res);

  CopyWith$Query$FetchOrder$fetchOrder$pay<TRes> get pay =>
      CopyWith$Query$FetchOrder$fetchOrder$pay.stub(_res);
}

class Query$FetchOrder$fetchOrder$cart {
  Query$FetchOrder$fetchOrder$cart({
    required this.id,
    this.items,
    this.lastUpdated,
    this.$__typename = 'Cart',
  });

  factory Query$FetchOrder$fetchOrder$cart.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$items = json['items'];
    final l$lastUpdated = json['lastUpdated'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrder$fetchOrder$cart(
      id: (l$id as String),
      items: (l$items as List<dynamic>?)?.map((e) => (e as String)).toList(),
      lastUpdated: l$lastUpdated == null
          ? null
          : fromJsonIsoDateTime(l$lastUpdated),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<String>? items;

  final DateTime? lastUpdated;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items?.map((e) => e).toList();
    final l$lastUpdated = lastUpdated;
    _resultData['lastUpdated'] = l$lastUpdated == null
        ? null
        : toJsonIsoDateTime(l$lastUpdated);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$items = items;
    final l$lastUpdated = lastUpdated;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$items == null ? null : Object.hashAll(l$items.map((v) => v)),
      l$lastUpdated,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchOrder$fetchOrder$cart ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != null && lOther$items != null) {
      if (l$items.length != lOther$items.length) {
        return false;
      }
      for (int i = 0; i < l$items.length; i++) {
        final l$items$entry = l$items[i];
        final lOther$items$entry = lOther$items[i];
        if (l$items$entry != lOther$items$entry) {
          return false;
        }
      }
    } else if (l$items != lOther$items) {
      return false;
    }
    final l$lastUpdated = lastUpdated;
    final lOther$lastUpdated = other.lastUpdated;
    if (l$lastUpdated != lOther$lastUpdated) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchOrder$fetchOrder$cart
    on Query$FetchOrder$fetchOrder$cart {
  CopyWith$Query$FetchOrder$fetchOrder$cart<Query$FetchOrder$fetchOrder$cart>
  get copyWith => CopyWith$Query$FetchOrder$fetchOrder$cart(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrder$fetchOrder$cart<TRes> {
  factory CopyWith$Query$FetchOrder$fetchOrder$cart(
    Query$FetchOrder$fetchOrder$cart instance,
    TRes Function(Query$FetchOrder$fetchOrder$cart) then,
  ) = _CopyWithImpl$Query$FetchOrder$fetchOrder$cart;

  factory CopyWith$Query$FetchOrder$fetchOrder$cart.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrder$fetchOrder$cart;

  TRes call({
    String? id,
    List<String>? items,
    DateTime? lastUpdated,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchOrder$fetchOrder$cart<TRes>
    implements CopyWith$Query$FetchOrder$fetchOrder$cart<TRes> {
  _CopyWithImpl$Query$FetchOrder$fetchOrder$cart(this._instance, this._then);

  final Query$FetchOrder$fetchOrder$cart _instance;

  final TRes Function(Query$FetchOrder$fetchOrder$cart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? items = _undefined,
    Object? lastUpdated = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrder$fetchOrder$cart(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      items: items == _undefined ? _instance.items : (items as List<String>?),
      lastUpdated: lastUpdated == _undefined
          ? _instance.lastUpdated
          : (lastUpdated as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FetchOrder$fetchOrder$cart<TRes>
    implements CopyWith$Query$FetchOrder$fetchOrder$cart<TRes> {
  _CopyWithStubImpl$Query$FetchOrder$fetchOrder$cart(this._res);

  TRes _res;

  call({
    String? id,
    List<String>? items,
    DateTime? lastUpdated,
    String? $__typename,
  }) => _res;
}

class Query$FetchOrder$fetchOrder$pay {
  Query$FetchOrder$fetchOrder$pay({
    required this.id,
    this.amountInCents,
    this.holdRequestTime,
    this.payCaptureTime,
    this.$__typename = 'Pay',
  });

  factory Query$FetchOrder$fetchOrder$pay.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$amountInCents = json['amountInCents'];
    final l$holdRequestTime = json['holdRequestTime'];
    final l$payCaptureTime = json['payCaptureTime'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrder$fetchOrder$pay(
      id: (l$id as String),
      amountInCents: (l$amountInCents as int?),
      holdRequestTime: l$holdRequestTime == null
          ? null
          : fromJsonIsoDateTime(l$holdRequestTime),
      payCaptureTime: l$payCaptureTime == null
          ? null
          : fromJsonIsoDateTime(l$payCaptureTime),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int? amountInCents;

  final DateTime? holdRequestTime;

  final DateTime? payCaptureTime;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$amountInCents = amountInCents;
    _resultData['amountInCents'] = l$amountInCents;
    final l$holdRequestTime = holdRequestTime;
    _resultData['holdRequestTime'] = l$holdRequestTime == null
        ? null
        : toJsonIsoDateTime(l$holdRequestTime);
    final l$payCaptureTime = payCaptureTime;
    _resultData['payCaptureTime'] = l$payCaptureTime == null
        ? null
        : toJsonIsoDateTime(l$payCaptureTime);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$amountInCents = amountInCents;
    final l$holdRequestTime = holdRequestTime;
    final l$payCaptureTime = payCaptureTime;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$amountInCents,
      l$holdRequestTime,
      l$payCaptureTime,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchOrder$fetchOrder$pay ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$amountInCents = amountInCents;
    final lOther$amountInCents = other.amountInCents;
    if (l$amountInCents != lOther$amountInCents) {
      return false;
    }
    final l$holdRequestTime = holdRequestTime;
    final lOther$holdRequestTime = other.holdRequestTime;
    if (l$holdRequestTime != lOther$holdRequestTime) {
      return false;
    }
    final l$payCaptureTime = payCaptureTime;
    final lOther$payCaptureTime = other.payCaptureTime;
    if (l$payCaptureTime != lOther$payCaptureTime) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchOrder$fetchOrder$pay
    on Query$FetchOrder$fetchOrder$pay {
  CopyWith$Query$FetchOrder$fetchOrder$pay<Query$FetchOrder$fetchOrder$pay>
  get copyWith => CopyWith$Query$FetchOrder$fetchOrder$pay(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrder$fetchOrder$pay<TRes> {
  factory CopyWith$Query$FetchOrder$fetchOrder$pay(
    Query$FetchOrder$fetchOrder$pay instance,
    TRes Function(Query$FetchOrder$fetchOrder$pay) then,
  ) = _CopyWithImpl$Query$FetchOrder$fetchOrder$pay;

  factory CopyWith$Query$FetchOrder$fetchOrder$pay.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrder$fetchOrder$pay;

  TRes call({
    String? id,
    int? amountInCents,
    DateTime? holdRequestTime,
    DateTime? payCaptureTime,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchOrder$fetchOrder$pay<TRes>
    implements CopyWith$Query$FetchOrder$fetchOrder$pay<TRes> {
  _CopyWithImpl$Query$FetchOrder$fetchOrder$pay(this._instance, this._then);

  final Query$FetchOrder$fetchOrder$pay _instance;

  final TRes Function(Query$FetchOrder$fetchOrder$pay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? amountInCents = _undefined,
    Object? holdRequestTime = _undefined,
    Object? payCaptureTime = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrder$fetchOrder$pay(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      amountInCents: amountInCents == _undefined
          ? _instance.amountInCents
          : (amountInCents as int?),
      holdRequestTime: holdRequestTime == _undefined
          ? _instance.holdRequestTime
          : (holdRequestTime as DateTime?),
      payCaptureTime: payCaptureTime == _undefined
          ? _instance.payCaptureTime
          : (payCaptureTime as DateTime?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FetchOrder$fetchOrder$pay<TRes>
    implements CopyWith$Query$FetchOrder$fetchOrder$pay<TRes> {
  _CopyWithStubImpl$Query$FetchOrder$fetchOrder$pay(this._res);

  TRes _res;

  call({
    String? id,
    int? amountInCents,
    DateTime? holdRequestTime,
    DateTime? payCaptureTime,
    String? $__typename,
  }) => _res;
}
