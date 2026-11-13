import '../schema.graphql.dart';

import 'dart:async';

import 'package:flutter_webview_cart/database/scalars.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$PlaceOrder {
  factory Variables$Mutation$PlaceOrder({
    required Input$PlaceOrderInput input,
  }) => Variables$Mutation$PlaceOrder._({r'input': input});

  Variables$Mutation$PlaceOrder._(this._$data);

  factory Variables$Mutation$PlaceOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$PlaceOrderInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$PlaceOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PlaceOrderInput get input => (_$data['input'] as Input$PlaceOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$PlaceOrder<Variables$Mutation$PlaceOrder>
  get copyWith => CopyWith$Variables$Mutation$PlaceOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$PlaceOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$PlaceOrder<TRes> {
  factory CopyWith$Variables$Mutation$PlaceOrder(
    Variables$Mutation$PlaceOrder instance,
    TRes Function(Variables$Mutation$PlaceOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$PlaceOrder;

  factory CopyWith$Variables$Mutation$PlaceOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$PlaceOrder;

  TRes call({Input$PlaceOrderInput? input});
}

class _CopyWithImpl$Variables$Mutation$PlaceOrder<TRes>
    implements CopyWith$Variables$Mutation$PlaceOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$PlaceOrder(this._instance, this._then);

  final Variables$Mutation$PlaceOrder _instance;

  final TRes Function(Variables$Mutation$PlaceOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$PlaceOrder._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$PlaceOrderInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$PlaceOrder<TRes>
    implements CopyWith$Variables$Mutation$PlaceOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$PlaceOrder(this._res);

  TRes _res;

  call({Input$PlaceOrderInput? input}) => _res;
}

class Mutation$PlaceOrder {
  Mutation$PlaceOrder({this.placeOrder, this.$__typename = 'Mutation'});

  factory Mutation$PlaceOrder.fromJson(Map<String, dynamic> json) {
    final l$placeOrder = json['placeOrder'];
    final l$$__typename = json['__typename'];
    return Mutation$PlaceOrder(
      placeOrder: l$placeOrder == null
          ? null
          : Mutation$PlaceOrder$placeOrder.fromJson(
              (l$placeOrder as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$PlaceOrder$placeOrder? placeOrder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$placeOrder = placeOrder;
    _resultData['placeOrder'] = l$placeOrder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$placeOrder = placeOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$placeOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$PlaceOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$placeOrder = placeOrder;
    final lOther$placeOrder = other.placeOrder;
    if (l$placeOrder != lOther$placeOrder) {
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

extension UtilityExtension$Mutation$PlaceOrder on Mutation$PlaceOrder {
  CopyWith$Mutation$PlaceOrder<Mutation$PlaceOrder> get copyWith =>
      CopyWith$Mutation$PlaceOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$PlaceOrder<TRes> {
  factory CopyWith$Mutation$PlaceOrder(
    Mutation$PlaceOrder instance,
    TRes Function(Mutation$PlaceOrder) then,
  ) = _CopyWithImpl$Mutation$PlaceOrder;

  factory CopyWith$Mutation$PlaceOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$PlaceOrder;

  TRes call({Mutation$PlaceOrder$placeOrder? placeOrder, String? $__typename});
  CopyWith$Mutation$PlaceOrder$placeOrder<TRes> get placeOrder;
}

class _CopyWithImpl$Mutation$PlaceOrder<TRes>
    implements CopyWith$Mutation$PlaceOrder<TRes> {
  _CopyWithImpl$Mutation$PlaceOrder(this._instance, this._then);

  final Mutation$PlaceOrder _instance;

  final TRes Function(Mutation$PlaceOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? placeOrder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$PlaceOrder(
      placeOrder: placeOrder == _undefined
          ? _instance.placeOrder
          : (placeOrder as Mutation$PlaceOrder$placeOrder?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$PlaceOrder$placeOrder<TRes> get placeOrder {
    final local$placeOrder = _instance.placeOrder;
    return local$placeOrder == null
        ? CopyWith$Mutation$PlaceOrder$placeOrder.stub(_then(_instance))
        : CopyWith$Mutation$PlaceOrder$placeOrder(
            local$placeOrder,
            (e) => call(placeOrder: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$PlaceOrder<TRes>
    implements CopyWith$Mutation$PlaceOrder<TRes> {
  _CopyWithStubImpl$Mutation$PlaceOrder(this._res);

  TRes _res;

  call({Mutation$PlaceOrder$placeOrder? placeOrder, String? $__typename}) =>
      _res;

  CopyWith$Mutation$PlaceOrder$placeOrder<TRes> get placeOrder =>
      CopyWith$Mutation$PlaceOrder$placeOrder.stub(_res);
}

const documentNodeMutationPlaceOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'PlaceOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'PlaceOrderInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'placeOrder'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
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
                  name: NameNode(value: 'status'),
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
Mutation$PlaceOrder _parserFn$Mutation$PlaceOrder(Map<String, dynamic> data) =>
    Mutation$PlaceOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$PlaceOrder = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$PlaceOrder?,
);

class Options$Mutation$PlaceOrder
    extends graphql.MutationOptions<Mutation$PlaceOrder> {
  Options$Mutation$PlaceOrder({
    String? operationName,
    required Variables$Mutation$PlaceOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PlaceOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$PlaceOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$PlaceOrder>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$PlaceOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationPlaceOrder,
         parserFn: _parserFn$Mutation$PlaceOrder,
       );

  final OnMutationCompleted$Mutation$PlaceOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$PlaceOrder
    extends graphql.WatchQueryOptions<Mutation$PlaceOrder> {
  WatchOptions$Mutation$PlaceOrder({
    String? operationName,
    required Variables$Mutation$PlaceOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$PlaceOrder? typedOptimisticResult,
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
         document: documentNodeMutationPlaceOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$PlaceOrder,
       );
}

extension ClientExtension$Mutation$PlaceOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$PlaceOrder>> mutate$PlaceOrder(
    Options$Mutation$PlaceOrder options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$PlaceOrder> watchMutation$PlaceOrder(
    WatchOptions$Mutation$PlaceOrder options,
  ) => this.watchMutation(options);
}

class Mutation$PlaceOrder$placeOrder {
  Mutation$PlaceOrder$placeOrder({
    required this.id,
    required this.status,
    this.$__typename = 'Order',
  });

  factory Mutation$PlaceOrder$placeOrder.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$PlaceOrder$placeOrder(
      id: fromJsonId(l$id),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$OrderStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = toJsonId(l$id);
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$PlaceOrder$placeOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$PlaceOrder$placeOrder
    on Mutation$PlaceOrder$placeOrder {
  CopyWith$Mutation$PlaceOrder$placeOrder<Mutation$PlaceOrder$placeOrder>
  get copyWith => CopyWith$Mutation$PlaceOrder$placeOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$PlaceOrder$placeOrder<TRes> {
  factory CopyWith$Mutation$PlaceOrder$placeOrder(
    Mutation$PlaceOrder$placeOrder instance,
    TRes Function(Mutation$PlaceOrder$placeOrder) then,
  ) = _CopyWithImpl$Mutation$PlaceOrder$placeOrder;

  factory CopyWith$Mutation$PlaceOrder$placeOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$PlaceOrder$placeOrder;

  TRes call({String? id, Enum$OrderStatus? status, String? $__typename});
}

class _CopyWithImpl$Mutation$PlaceOrder$placeOrder<TRes>
    implements CopyWith$Mutation$PlaceOrder$placeOrder<TRes> {
  _CopyWithImpl$Mutation$PlaceOrder$placeOrder(this._instance, this._then);

  final Mutation$PlaceOrder$placeOrder _instance;

  final TRes Function(Mutation$PlaceOrder$placeOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$PlaceOrder$placeOrder(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$PlaceOrder$placeOrder<TRes>
    implements CopyWith$Mutation$PlaceOrder$placeOrder<TRes> {
  _CopyWithStubImpl$Mutation$PlaceOrder$placeOrder(this._res);

  TRes _res;

  call({String? id, Enum$OrderStatus? status, String? $__typename}) => _res;
}
