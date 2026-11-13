import 'dart:async';

import 'package:flutter_webview_cart/database/scalars.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$FetchPay {
  factory Variables$Query$FetchPay({required String id}) =>
      Variables$Query$FetchPay._({r'id': id});

  Variables$Query$FetchPay._(this._$data);

  factory Variables$Query$FetchPay.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = fromJsonId(l$id);
    return Variables$Query$FetchPay._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = toJsonId(l$id);
    return result$data;
  }

  CopyWith$Variables$Query$FetchPay<Variables$Query$FetchPay> get copyWith =>
      CopyWith$Variables$Query$FetchPay(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$FetchPay ||
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

abstract class CopyWith$Variables$Query$FetchPay<TRes> {
  factory CopyWith$Variables$Query$FetchPay(
    Variables$Query$FetchPay instance,
    TRes Function(Variables$Query$FetchPay) then,
  ) = _CopyWithImpl$Variables$Query$FetchPay;

  factory CopyWith$Variables$Query$FetchPay.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchPay;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$FetchPay<TRes>
    implements CopyWith$Variables$Query$FetchPay<TRes> {
  _CopyWithImpl$Variables$Query$FetchPay(this._instance, this._then);

  final Variables$Query$FetchPay _instance;

  final TRes Function(Variables$Query$FetchPay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$FetchPay._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$FetchPay<TRes>
    implements CopyWith$Variables$Query$FetchPay<TRes> {
  _CopyWithStubImpl$Variables$Query$FetchPay(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$FetchPay {
  Query$FetchPay({this.fetchPay, this.$__typename = 'Query'});

  factory Query$FetchPay.fromJson(Map<String, dynamic> json) {
    final l$fetchPay = json['fetchPay'];
    final l$$__typename = json['__typename'];
    return Query$FetchPay(
      fetchPay: l$fetchPay == null
          ? null
          : Query$FetchPay$fetchPay.fromJson(
              (l$fetchPay as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchPay$fetchPay? fetchPay;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$fetchPay = fetchPay;
    _resultData['fetchPay'] = l$fetchPay?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$fetchPay = fetchPay;
    final l$$__typename = $__typename;
    return Object.hashAll([l$fetchPay, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchPay || runtimeType != other.runtimeType) {
      return false;
    }
    final l$fetchPay = fetchPay;
    final lOther$fetchPay = other.fetchPay;
    if (l$fetchPay != lOther$fetchPay) {
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

extension UtilityExtension$Query$FetchPay on Query$FetchPay {
  CopyWith$Query$FetchPay<Query$FetchPay> get copyWith =>
      CopyWith$Query$FetchPay(this, (i) => i);
}

abstract class CopyWith$Query$FetchPay<TRes> {
  factory CopyWith$Query$FetchPay(
    Query$FetchPay instance,
    TRes Function(Query$FetchPay) then,
  ) = _CopyWithImpl$Query$FetchPay;

  factory CopyWith$Query$FetchPay.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchPay;

  TRes call({Query$FetchPay$fetchPay? fetchPay, String? $__typename});
  CopyWith$Query$FetchPay$fetchPay<TRes> get fetchPay;
}

class _CopyWithImpl$Query$FetchPay<TRes>
    implements CopyWith$Query$FetchPay<TRes> {
  _CopyWithImpl$Query$FetchPay(this._instance, this._then);

  final Query$FetchPay _instance;

  final TRes Function(Query$FetchPay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? fetchPay = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchPay(
      fetchPay: fetchPay == _undefined
          ? _instance.fetchPay
          : (fetchPay as Query$FetchPay$fetchPay?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FetchPay$fetchPay<TRes> get fetchPay {
    final local$fetchPay = _instance.fetchPay;
    return local$fetchPay == null
        ? CopyWith$Query$FetchPay$fetchPay.stub(_then(_instance))
        : CopyWith$Query$FetchPay$fetchPay(
            local$fetchPay,
            (e) => call(fetchPay: e),
          );
  }
}

class _CopyWithStubImpl$Query$FetchPay<TRes>
    implements CopyWith$Query$FetchPay<TRes> {
  _CopyWithStubImpl$Query$FetchPay(this._res);

  TRes _res;

  call({Query$FetchPay$fetchPay? fetchPay, String? $__typename}) => _res;

  CopyWith$Query$FetchPay$fetchPay<TRes> get fetchPay =>
      CopyWith$Query$FetchPay$fetchPay.stub(_res);
}

const documentNodeQueryFetchPay = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchPay'),
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
            name: NameNode(value: 'fetchPay'),
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
                  name: NameNode(value: 'amountInCents'),
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
Query$FetchPay _parserFn$Query$FetchPay(Map<String, dynamic> data) =>
    Query$FetchPay.fromJson(data);
typedef OnQueryComplete$Query$FetchPay = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FetchPay?,
);

class Options$Query$FetchPay extends graphql.QueryOptions<Query$FetchPay> {
  Options$Query$FetchPay({
    String? operationName,
    required Variables$Query$FetchPay variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchPay? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FetchPay? onComplete,
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
                 data == null ? null : _parserFn$Query$FetchPay(data),
               ),
         onError: onError,
         document: documentNodeQueryFetchPay,
         parserFn: _parserFn$Query$FetchPay,
       );

  final OnQueryComplete$Query$FetchPay? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$FetchPay
    extends graphql.WatchQueryOptions<Query$FetchPay> {
  WatchOptions$Query$FetchPay({
    String? operationName,
    required Variables$Query$FetchPay variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchPay? typedOptimisticResult,
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
         document: documentNodeQueryFetchPay,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$FetchPay,
       );
}

class FetchMoreOptions$Query$FetchPay extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchPay({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FetchPay variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryFetchPay,
       );
}

extension ClientExtension$Query$FetchPay on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchPay>> query$FetchPay(
    Options$Query$FetchPay options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$FetchPay> watchQuery$FetchPay(
    WatchOptions$Query$FetchPay options,
  ) => this.watchQuery(options);

  void writeQuery$FetchPay({
    required Query$FetchPay data,
    required Variables$Query$FetchPay variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryFetchPay),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$FetchPay? readQuery$FetchPay({
    required Variables$Query$FetchPay variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFetchPay),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FetchPay.fromJson(result);
  }
}

class Query$FetchPay$fetchPay {
  Query$FetchPay$fetchPay({
    required this.id,
    this.holdRequestTime,
    this.payCaptureTime,
    this.amountInCents,
    this.$__typename = 'Pay',
  });

  factory Query$FetchPay$fetchPay.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$holdRequestTime = json['holdRequestTime'];
    final l$payCaptureTime = json['payCaptureTime'];
    final l$amountInCents = json['amountInCents'];
    final l$$__typename = json['__typename'];
    return Query$FetchPay$fetchPay(
      id: fromJsonId(l$id),
      holdRequestTime: l$holdRequestTime == null
          ? null
          : fromJsonIsoDateTime(l$holdRequestTime),
      payCaptureTime: l$payCaptureTime == null
          ? null
          : fromJsonIsoDateTime(l$payCaptureTime),
      amountInCents: l$amountInCents == null
          ? null
          : fromJsonInt(l$amountInCents),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime? holdRequestTime;

  final DateTime? payCaptureTime;

  final int? amountInCents;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = toJsonId(l$id);
    final l$holdRequestTime = holdRequestTime;
    _resultData['holdRequestTime'] = l$holdRequestTime == null
        ? null
        : toJsonIsoDateTime(l$holdRequestTime);
    final l$payCaptureTime = payCaptureTime;
    _resultData['payCaptureTime'] = l$payCaptureTime == null
        ? null
        : toJsonIsoDateTime(l$payCaptureTime);
    final l$amountInCents = amountInCents;
    _resultData['amountInCents'] = l$amountInCents == null
        ? null
        : toJsonInt(l$amountInCents);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$holdRequestTime = holdRequestTime;
    final l$payCaptureTime = payCaptureTime;
    final l$amountInCents = amountInCents;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$holdRequestTime,
      l$payCaptureTime,
      l$amountInCents,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchPay$fetchPay || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$amountInCents = amountInCents;
    final lOther$amountInCents = other.amountInCents;
    if (l$amountInCents != lOther$amountInCents) {
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

extension UtilityExtension$Query$FetchPay$fetchPay on Query$FetchPay$fetchPay {
  CopyWith$Query$FetchPay$fetchPay<Query$FetchPay$fetchPay> get copyWith =>
      CopyWith$Query$FetchPay$fetchPay(this, (i) => i);
}

abstract class CopyWith$Query$FetchPay$fetchPay<TRes> {
  factory CopyWith$Query$FetchPay$fetchPay(
    Query$FetchPay$fetchPay instance,
    TRes Function(Query$FetchPay$fetchPay) then,
  ) = _CopyWithImpl$Query$FetchPay$fetchPay;

  factory CopyWith$Query$FetchPay$fetchPay.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchPay$fetchPay;

  TRes call({
    String? id,
    DateTime? holdRequestTime,
    DateTime? payCaptureTime,
    int? amountInCents,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchPay$fetchPay<TRes>
    implements CopyWith$Query$FetchPay$fetchPay<TRes> {
  _CopyWithImpl$Query$FetchPay$fetchPay(this._instance, this._then);

  final Query$FetchPay$fetchPay _instance;

  final TRes Function(Query$FetchPay$fetchPay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? holdRequestTime = _undefined,
    Object? payCaptureTime = _undefined,
    Object? amountInCents = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchPay$fetchPay(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      holdRequestTime: holdRequestTime == _undefined
          ? _instance.holdRequestTime
          : (holdRequestTime as DateTime?),
      payCaptureTime: payCaptureTime == _undefined
          ? _instance.payCaptureTime
          : (payCaptureTime as DateTime?),
      amountInCents: amountInCents == _undefined
          ? _instance.amountInCents
          : (amountInCents as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FetchPay$fetchPay<TRes>
    implements CopyWith$Query$FetchPay$fetchPay<TRes> {
  _CopyWithStubImpl$Query$FetchPay$fetchPay(this._res);

  TRes _res;

  call({
    String? id,
    DateTime? holdRequestTime,
    DateTime? payCaptureTime,
    int? amountInCents,
    String? $__typename,
  }) => _res;
}
