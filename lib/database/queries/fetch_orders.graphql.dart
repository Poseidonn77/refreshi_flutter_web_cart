import '../schema.graphql.dart';

import 'dart:async';

import 'package:flutter_webview_cart/database/scalars.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$FetchOrders {
  Query$FetchOrders({required this.fetchOrders, this.$__typename = 'Query'});

  factory Query$FetchOrders.fromJson(Map<String, dynamic> json) {
    final l$fetchOrders = json['fetchOrders'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrders(
      fetchOrders: (l$fetchOrders as List<dynamic>)
          .map(
            (e) => Query$FetchOrders$fetchOrders.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchOrders$fetchOrders> fetchOrders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$fetchOrders = fetchOrders;
    _resultData['fetchOrders'] = l$fetchOrders.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$fetchOrders = fetchOrders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$fetchOrders.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchOrders || runtimeType != other.runtimeType) {
      return false;
    }
    final l$fetchOrders = fetchOrders;
    final lOther$fetchOrders = other.fetchOrders;
    if (l$fetchOrders.length != lOther$fetchOrders.length) {
      return false;
    }
    for (int i = 0; i < l$fetchOrders.length; i++) {
      final l$fetchOrders$entry = l$fetchOrders[i];
      final lOther$fetchOrders$entry = lOther$fetchOrders[i];
      if (l$fetchOrders$entry != lOther$fetchOrders$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchOrders on Query$FetchOrders {
  CopyWith$Query$FetchOrders<Query$FetchOrders> get copyWith =>
      CopyWith$Query$FetchOrders(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrders<TRes> {
  factory CopyWith$Query$FetchOrders(
    Query$FetchOrders instance,
    TRes Function(Query$FetchOrders) then,
  ) = _CopyWithImpl$Query$FetchOrders;

  factory CopyWith$Query$FetchOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrders;

  TRes call({
    List<Query$FetchOrders$fetchOrders>? fetchOrders,
    String? $__typename,
  });
  TRes fetchOrders(
    Iterable<Query$FetchOrders$fetchOrders> Function(
      Iterable<
        CopyWith$Query$FetchOrders$fetchOrders<Query$FetchOrders$fetchOrders>
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$FetchOrders<TRes>
    implements CopyWith$Query$FetchOrders<TRes> {
  _CopyWithImpl$Query$FetchOrders(this._instance, this._then);

  final Query$FetchOrders _instance;

  final TRes Function(Query$FetchOrders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fetchOrders = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrders(
      fetchOrders: fetchOrders == _undefined || fetchOrders == null
          ? _instance.fetchOrders
          : (fetchOrders as List<Query$FetchOrders$fetchOrders>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes fetchOrders(
    Iterable<Query$FetchOrders$fetchOrders> Function(
      Iterable<
        CopyWith$Query$FetchOrders$fetchOrders<Query$FetchOrders$fetchOrders>
      >,
    )
    _fn,
  ) => call(
    fetchOrders: _fn(
      _instance.fetchOrders.map(
        (e) => CopyWith$Query$FetchOrders$fetchOrders(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$FetchOrders<TRes>
    implements CopyWith$Query$FetchOrders<TRes> {
  _CopyWithStubImpl$Query$FetchOrders(this._res);

  TRes _res;

  call({
    List<Query$FetchOrders$fetchOrders>? fetchOrders,
    String? $__typename,
  }) => _res;

  fetchOrders(_fn) => _res;
}

const documentNodeQueryFetchOrders = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchOrders'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'fetchOrders'),
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
                  name: NameNode(value: 'dateOfOrder'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'status'),
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
Query$FetchOrders _parserFn$Query$FetchOrders(Map<String, dynamic> data) =>
    Query$FetchOrders.fromJson(data);
typedef OnQueryComplete$Query$FetchOrders = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FetchOrders?,
);

class Options$Query$FetchOrders
    extends graphql.QueryOptions<Query$FetchOrders> {
  Options$Query$FetchOrders({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchOrders? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FetchOrders? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
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
                 data == null ? null : _parserFn$Query$FetchOrders(data),
               ),
         onError: onError,
         document: documentNodeQueryFetchOrders,
         parserFn: _parserFn$Query$FetchOrders,
       );

  final OnQueryComplete$Query$FetchOrders? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FetchOrders
    extends graphql.WatchQueryOptions<Query$FetchOrders> {
  WatchOptions$Query$FetchOrders({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchOrders? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryFetchOrders,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FetchOrders,
       );
}

class FetchMoreOptions$Query$FetchOrders extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchOrders({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryFetchOrders);
}

extension ClientExtension$Query$FetchOrders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchOrders>> query$FetchOrders([
    Options$Query$FetchOrders? options,
  ]) async => await this.query(options ?? Options$Query$FetchOrders());

  graphql.ObservableQuery<Query$FetchOrders> watchQuery$FetchOrders([
    WatchOptions$Query$FetchOrders? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$FetchOrders());

  void writeQuery$FetchOrders({
    required Query$FetchOrders data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFetchOrders),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FetchOrders? readQuery$FetchOrders({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFetchOrders),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FetchOrders.fromJson(result);
  }
}

class Query$FetchOrders$fetchOrders {
  Query$FetchOrders$fetchOrders({
    required this.id,
    this.dateOfOrder,
    required this.status,
    this.timeSlotStart,
    this.timeSlotEnd,
    this.cart,
    this.pay,
    this.$__typename = 'Order',
  });

  factory Query$FetchOrders$fetchOrders.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$dateOfOrder = json['dateOfOrder'];
    final l$status = json['status'];
    final l$timeSlotStart = json['timeSlotStart'];
    final l$timeSlotEnd = json['timeSlotEnd'];
    final l$cart = json['cart'];
    final l$pay = json['pay'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrders$fetchOrders(
      id: fromJsonId(l$id),
      dateOfOrder: l$dateOfOrder == null
          ? null
          : fromJsonIsoDateTime(l$dateOfOrder),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      timeSlotStart: l$timeSlotStart == null
          ? null
          : fromJsonIsoDateTime(l$timeSlotStart),
      timeSlotEnd: l$timeSlotEnd == null
          ? null
          : fromJsonIsoDateTime(l$timeSlotEnd),
      cart: l$cart == null
          ? null
          : Query$FetchOrders$fetchOrders$cart.fromJson(
              (l$cart as Map<String, dynamic>),
            ),
      pay: l$pay == null
          ? null
          : Query$FetchOrders$fetchOrders$pay.fromJson(
              (l$pay as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime? dateOfOrder;

  final Enum$OrderStatus status;

  final DateTime? timeSlotStart;

  final DateTime? timeSlotEnd;

  final Query$FetchOrders$fetchOrders$cart? cart;

  final Query$FetchOrders$fetchOrders$pay? pay;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = toJsonId(l$id);
    final l$dateOfOrder = dateOfOrder;
    _resultData['dateOfOrder'] = l$dateOfOrder == null
        ? null
        : toJsonIsoDateTime(l$dateOfOrder);
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
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
    final l$status = status;
    final l$timeSlotStart = timeSlotStart;
    final l$timeSlotEnd = timeSlotEnd;
    final l$cart = cart;
    final l$pay = pay;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$dateOfOrder,
      l$status,
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
    if (other is! Query$FetchOrders$fetchOrders ||
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Query$FetchOrders$fetchOrders
    on Query$FetchOrders$fetchOrders {
  CopyWith$Query$FetchOrders$fetchOrders<Query$FetchOrders$fetchOrders>
  get copyWith => CopyWith$Query$FetchOrders$fetchOrders(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrders$fetchOrders<TRes> {
  factory CopyWith$Query$FetchOrders$fetchOrders(
    Query$FetchOrders$fetchOrders instance,
    TRes Function(Query$FetchOrders$fetchOrders) then,
  ) = _CopyWithImpl$Query$FetchOrders$fetchOrders;

  factory CopyWith$Query$FetchOrders$fetchOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrders$fetchOrders;

  TRes call({
    String? id,
    DateTime? dateOfOrder,
    Enum$OrderStatus? status,
    DateTime? timeSlotStart,
    DateTime? timeSlotEnd,
    Query$FetchOrders$fetchOrders$cart? cart,
    Query$FetchOrders$fetchOrders$pay? pay,
    String? $__typename,
  });
  CopyWith$Query$FetchOrders$fetchOrders$cart<TRes> get cart;
  CopyWith$Query$FetchOrders$fetchOrders$pay<TRes> get pay;
}

class _CopyWithImpl$Query$FetchOrders$fetchOrders<TRes>
    implements CopyWith$Query$FetchOrders$fetchOrders<TRes> {
  _CopyWithImpl$Query$FetchOrders$fetchOrders(this._instance, this._then);

  final Query$FetchOrders$fetchOrders _instance;

  final TRes Function(Query$FetchOrders$fetchOrders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? dateOfOrder = _undefined,
    Object? status = _undefined,
    Object? timeSlotStart = _undefined,
    Object? timeSlotEnd = _undefined,
    Object? cart = _undefined,
    Object? pay = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrders$fetchOrders(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      dateOfOrder: dateOfOrder == _undefined
          ? _instance.dateOfOrder
          : (dateOfOrder as DateTime?),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      timeSlotStart: timeSlotStart == _undefined
          ? _instance.timeSlotStart
          : (timeSlotStart as DateTime?),
      timeSlotEnd: timeSlotEnd == _undefined
          ? _instance.timeSlotEnd
          : (timeSlotEnd as DateTime?),
      cart: cart == _undefined
          ? _instance.cart
          : (cart as Query$FetchOrders$fetchOrders$cart?),
      pay: pay == _undefined
          ? _instance.pay
          : (pay as Query$FetchOrders$fetchOrders$pay?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FetchOrders$fetchOrders$cart<TRes> get cart {
    final local$cart = _instance.cart;
    return local$cart == null
        ? CopyWith$Query$FetchOrders$fetchOrders$cart.stub(_then(_instance))
        : CopyWith$Query$FetchOrders$fetchOrders$cart(
            local$cart,
            (e) => call(cart: e),
          );
  }

  CopyWith$Query$FetchOrders$fetchOrders$pay<TRes> get pay {
    final local$pay = _instance.pay;
    return local$pay == null
        ? CopyWith$Query$FetchOrders$fetchOrders$pay.stub(_then(_instance))
        : CopyWith$Query$FetchOrders$fetchOrders$pay(
            local$pay,
            (e) => call(pay: e),
          );
  }
}

class _CopyWithStubImpl$Query$FetchOrders$fetchOrders<TRes>
    implements CopyWith$Query$FetchOrders$fetchOrders<TRes> {
  _CopyWithStubImpl$Query$FetchOrders$fetchOrders(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? dateOfOrder,
    Enum$OrderStatus? status,
    DateTime? timeSlotStart,
    DateTime? timeSlotEnd,
    Query$FetchOrders$fetchOrders$cart? cart,
    Query$FetchOrders$fetchOrders$pay? pay,
    String? $__typename,
  }) => _res;

  CopyWith$Query$FetchOrders$fetchOrders$cart<TRes> get cart =>
      CopyWith$Query$FetchOrders$fetchOrders$cart.stub(_res);

  CopyWith$Query$FetchOrders$fetchOrders$pay<TRes> get pay =>
      CopyWith$Query$FetchOrders$fetchOrders$pay.stub(_res);
}

class Query$FetchOrders$fetchOrders$cart {
  Query$FetchOrders$fetchOrders$cart({
    required this.id,
    this.items,
    this.$__typename = 'Cart',
  });

  factory Query$FetchOrders$fetchOrders$cart.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrders$fetchOrders$cart(
      id: fromJsonId(l$id),
      items: (l$items as List<dynamic>?)?.map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<String>? items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = toJsonId(l$id);
    final l$items = items;
    _resultData['items'] = l$items?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$items == null ? null : Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchOrders$fetchOrders$cart ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchOrders$fetchOrders$cart
    on Query$FetchOrders$fetchOrders$cart {
  CopyWith$Query$FetchOrders$fetchOrders$cart<
    Query$FetchOrders$fetchOrders$cart
  >
  get copyWith => CopyWith$Query$FetchOrders$fetchOrders$cart(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrders$fetchOrders$cart<TRes> {
  factory CopyWith$Query$FetchOrders$fetchOrders$cart(
    Query$FetchOrders$fetchOrders$cart instance,
    TRes Function(Query$FetchOrders$fetchOrders$cart) then,
  ) = _CopyWithImpl$Query$FetchOrders$fetchOrders$cart;

  factory CopyWith$Query$FetchOrders$fetchOrders$cart.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrders$fetchOrders$cart;

  TRes call({String? id, List<String>? items, String? $__typename});
}

class _CopyWithImpl$Query$FetchOrders$fetchOrders$cart<TRes>
    implements CopyWith$Query$FetchOrders$fetchOrders$cart<TRes> {
  _CopyWithImpl$Query$FetchOrders$fetchOrders$cart(this._instance, this._then);

  final Query$FetchOrders$fetchOrders$cart _instance;

  final TRes Function(Query$FetchOrders$fetchOrders$cart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrders$fetchOrders$cart(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      items: items == _undefined ? _instance.items : (items as List<String>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FetchOrders$fetchOrders$cart<TRes>
    implements CopyWith$Query$FetchOrders$fetchOrders$cart<TRes> {
  _CopyWithStubImpl$Query$FetchOrders$fetchOrders$cart(this._res);

  TRes _res;

  call({String? id, List<String>? items, String? $__typename}) => _res;
}

class Query$FetchOrders$fetchOrders$pay {
  Query$FetchOrders$fetchOrders$pay({
    required this.id,
    this.amountInCents,
    this.holdRequestTime,
    this.payCaptureTime,
    this.$__typename = 'Pay',
  });

  factory Query$FetchOrders$fetchOrders$pay.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$amountInCents = json['amountInCents'];
    final l$holdRequestTime = json['holdRequestTime'];
    final l$payCaptureTime = json['payCaptureTime'];
    final l$$__typename = json['__typename'];
    return Query$FetchOrders$fetchOrders$pay(
      id: fromJsonId(l$id),
      amountInCents: l$amountInCents == null
          ? null
          : fromJsonInt(l$amountInCents),
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
    _resultData['id'] = toJsonId(l$id);
    final l$amountInCents = amountInCents;
    _resultData['amountInCents'] = l$amountInCents == null
        ? null
        : toJsonInt(l$amountInCents);
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
    if (other is! Query$FetchOrders$fetchOrders$pay ||
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

extension UtilityExtension$Query$FetchOrders$fetchOrders$pay
    on Query$FetchOrders$fetchOrders$pay {
  CopyWith$Query$FetchOrders$fetchOrders$pay<Query$FetchOrders$fetchOrders$pay>
  get copyWith => CopyWith$Query$FetchOrders$fetchOrders$pay(this, (i) => i);
}

abstract class CopyWith$Query$FetchOrders$fetchOrders$pay<TRes> {
  factory CopyWith$Query$FetchOrders$fetchOrders$pay(
    Query$FetchOrders$fetchOrders$pay instance,
    TRes Function(Query$FetchOrders$fetchOrders$pay) then,
  ) = _CopyWithImpl$Query$FetchOrders$fetchOrders$pay;

  factory CopyWith$Query$FetchOrders$fetchOrders$pay.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchOrders$fetchOrders$pay;

  TRes call({
    String? id,
    int? amountInCents,
    DateTime? holdRequestTime,
    DateTime? payCaptureTime,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchOrders$fetchOrders$pay<TRes>
    implements CopyWith$Query$FetchOrders$fetchOrders$pay<TRes> {
  _CopyWithImpl$Query$FetchOrders$fetchOrders$pay(this._instance, this._then);

  final Query$FetchOrders$fetchOrders$pay _instance;

  final TRes Function(Query$FetchOrders$fetchOrders$pay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? amountInCents = _undefined,
    Object? holdRequestTime = _undefined,
    Object? payCaptureTime = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchOrders$fetchOrders$pay(
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

class _CopyWithStubImpl$Query$FetchOrders$fetchOrders$pay<TRes>
    implements CopyWith$Query$FetchOrders$fetchOrders$pay<TRes> {
  _CopyWithStubImpl$Query$FetchOrders$fetchOrders$pay(this._res);

  TRes _res;

  call({
    String? id,
    int? amountInCents,
    DateTime? holdRequestTime,
    DateTime? payCaptureTime,
    String? $__typename,
  }) => _res;
}
