import 'dart:async';

import 'package:flutter_webview_cart/database/scalars.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$FetchCart {
  factory Variables$Query$FetchCart({required String id}) =>
      Variables$Query$FetchCart._({r'id': id});

  Variables$Query$FetchCart._(this._$data);

  factory Variables$Query$FetchCart.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$FetchCart._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$FetchCart<Variables$Query$FetchCart> get copyWith =>
      CopyWith$Variables$Query$FetchCart(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$FetchCart ||
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

abstract class CopyWith$Variables$Query$FetchCart<TRes> {
  factory CopyWith$Variables$Query$FetchCart(
    Variables$Query$FetchCart instance,
    TRes Function(Variables$Query$FetchCart) then,
  ) = _CopyWithImpl$Variables$Query$FetchCart;

  factory CopyWith$Variables$Query$FetchCart.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchCart;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$FetchCart<TRes>
    implements CopyWith$Variables$Query$FetchCart<TRes> {
  _CopyWithImpl$Variables$Query$FetchCart(this._instance, this._then);

  final Variables$Query$FetchCart _instance;

  final TRes Function(Variables$Query$FetchCart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$FetchCart._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$FetchCart<TRes>
    implements CopyWith$Variables$Query$FetchCart<TRes> {
  _CopyWithStubImpl$Variables$Query$FetchCart(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$FetchCart {
  Query$FetchCart({this.fetchCart, this.$__typename = 'Query'});

  factory Query$FetchCart.fromJson(Map<String, dynamic> json) {
    final l$fetchCart = json['fetchCart'];
    final l$$__typename = json['__typename'];
    return Query$FetchCart(
      fetchCart: l$fetchCart == null
          ? null
          : Query$FetchCart$fetchCart.fromJson(
              (l$fetchCart as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchCart$fetchCart? fetchCart;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$fetchCart = fetchCart;
    _resultData['fetchCart'] = l$fetchCart?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$fetchCart = fetchCart;
    final l$$__typename = $__typename;
    return Object.hashAll([l$fetchCart, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchCart || runtimeType != other.runtimeType) {
      return false;
    }
    final l$fetchCart = fetchCart;
    final lOther$fetchCart = other.fetchCart;
    if (l$fetchCart != lOther$fetchCart) {
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

extension UtilityExtension$Query$FetchCart on Query$FetchCart {
  CopyWith$Query$FetchCart<Query$FetchCart> get copyWith =>
      CopyWith$Query$FetchCart(this, (i) => i);
}

abstract class CopyWith$Query$FetchCart<TRes> {
  factory CopyWith$Query$FetchCart(
    Query$FetchCart instance,
    TRes Function(Query$FetchCart) then,
  ) = _CopyWithImpl$Query$FetchCart;

  factory CopyWith$Query$FetchCart.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchCart;

  TRes call({Query$FetchCart$fetchCart? fetchCart, String? $__typename});
  CopyWith$Query$FetchCart$fetchCart<TRes> get fetchCart;
}

class _CopyWithImpl$Query$FetchCart<TRes>
    implements CopyWith$Query$FetchCart<TRes> {
  _CopyWithImpl$Query$FetchCart(this._instance, this._then);

  final Query$FetchCart _instance;

  final TRes Function(Query$FetchCart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fetchCart = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchCart(
      fetchCart: fetchCart == _undefined
          ? _instance.fetchCart
          : (fetchCart as Query$FetchCart$fetchCart?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FetchCart$fetchCart<TRes> get fetchCart {
    final local$fetchCart = _instance.fetchCart;
    return local$fetchCart == null
        ? CopyWith$Query$FetchCart$fetchCart.stub(_then(_instance))
        : CopyWith$Query$FetchCart$fetchCart(
            local$fetchCart,
            (e) => call(fetchCart: e),
          );
  }
}

class _CopyWithStubImpl$Query$FetchCart<TRes>
    implements CopyWith$Query$FetchCart<TRes> {
  _CopyWithStubImpl$Query$FetchCart(this._res);

  TRes _res;

  call({Query$FetchCart$fetchCart? fetchCart, String? $__typename}) => _res;

  CopyWith$Query$FetchCart$fetchCart<TRes> get fetchCart =>
      CopyWith$Query$FetchCart$fetchCart.stub(_res);
}

const documentNodeQueryFetchCart = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchCart'),
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
            name: NameNode(value: 'fetchCart'),
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
Query$FetchCart _parserFn$Query$FetchCart(Map<String, dynamic> data) =>
    Query$FetchCart.fromJson(data);
typedef OnQueryComplete$Query$FetchCart = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FetchCart?,
);

class Options$Query$FetchCart extends graphql.QueryOptions<Query$FetchCart> {
  Options$Query$FetchCart({
    String? operationName,
    required Variables$Query$FetchCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchCart? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FetchCart? onComplete,
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
                 data == null ? null : _parserFn$Query$FetchCart(data),
               ),
         onError: onError,
         document: documentNodeQueryFetchCart,
         parserFn: _parserFn$Query$FetchCart,
       );

  final OnQueryComplete$Query$FetchCart? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FetchCart
    extends graphql.WatchQueryOptions<Query$FetchCart> {
  WatchOptions$Query$FetchCart({
    String? operationName,
    required Variables$Query$FetchCart variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchCart? typedOptimisticResult,
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
         document: documentNodeQueryFetchCart,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FetchCart,
       );
}

class FetchMoreOptions$Query$FetchCart extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchCart({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FetchCart variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryFetchCart,
       );
}

extension ClientExtension$Query$FetchCart on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchCart>> query$FetchCart(
    Options$Query$FetchCart options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$FetchCart> watchQuery$FetchCart(
    WatchOptions$Query$FetchCart options,
  ) => this.watchQuery(options);

  void writeQuery$FetchCart({
    required Query$FetchCart data,
    required Variables$Query$FetchCart variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFetchCart),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FetchCart? readQuery$FetchCart({
    required Variables$Query$FetchCart variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFetchCart),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FetchCart.fromJson(result);
  }
}

class Query$FetchCart$fetchCart {
  Query$FetchCart$fetchCart({
    required this.id,
    this.items,
    this.lastUpdated,
    this.$__typename = 'Cart',
  });

  factory Query$FetchCart$fetchCart.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$items = json['items'];
    final l$lastUpdated = json['lastUpdated'];
    final l$$__typename = json['__typename'];
    return Query$FetchCart$fetchCart(
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
    if (other is! Query$FetchCart$fetchCart ||
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

extension UtilityExtension$Query$FetchCart$fetchCart
    on Query$FetchCart$fetchCart {
  CopyWith$Query$FetchCart$fetchCart<Query$FetchCart$fetchCart> get copyWith =>
      CopyWith$Query$FetchCart$fetchCart(this, (i) => i);
}

abstract class CopyWith$Query$FetchCart$fetchCart<TRes> {
  factory CopyWith$Query$FetchCart$fetchCart(
    Query$FetchCart$fetchCart instance,
    TRes Function(Query$FetchCart$fetchCart) then,
  ) = _CopyWithImpl$Query$FetchCart$fetchCart;

  factory CopyWith$Query$FetchCart$fetchCart.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchCart$fetchCart;

  TRes call({
    String? id,
    List<String>? items,
    DateTime? lastUpdated,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchCart$fetchCart<TRes>
    implements CopyWith$Query$FetchCart$fetchCart<TRes> {
  _CopyWithImpl$Query$FetchCart$fetchCart(this._instance, this._then);

  final Query$FetchCart$fetchCart _instance;

  final TRes Function(Query$FetchCart$fetchCart) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? items = _undefined,
    Object? lastUpdated = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchCart$fetchCart(
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

class _CopyWithStubImpl$Query$FetchCart$fetchCart<TRes>
    implements CopyWith$Query$FetchCart$fetchCart<TRes> {
  _CopyWithStubImpl$Query$FetchCart$fetchCart(this._res);

  TRes _res;

  call({
    String? id,
    List<String>? items,
    DateTime? lastUpdated,
    String? $__typename,
  }) => _res;
}
