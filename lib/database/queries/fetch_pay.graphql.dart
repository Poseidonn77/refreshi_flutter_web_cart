import 'package:gql/ast.dart';

class Variables$Query$FetchPay {
  factory Variables$Query$FetchPay({required String id}) =>
      Variables$Query$FetchPay._({r'id': id});

  Variables$Query$FetchPay._(this._$data);

  factory Variables$Query$FetchPay.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$FetchPay._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
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
  Query$FetchPay({this.FetchPay, this.$__typename = 'Query'});

  factory Query$FetchPay.fromJson(Map<String, dynamic> json) {
    final l$FetchPay = json['FetchPay'];
    final l$$__typename = json['__typename'];
    return Query$FetchPay(
      FetchPay: l$FetchPay == null
          ? null
          : Query$FetchPay$FetchPay.fromJson(
              (l$FetchPay as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchPay$FetchPay? FetchPay;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$FetchPay = FetchPay;
    _resultData['FetchPay'] = l$FetchPay?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$FetchPay = FetchPay;
    final l$$__typename = $__typename;
    return Object.hashAll([l$FetchPay, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchPay || runtimeType != other.runtimeType) {
      return false;
    }
    final l$FetchPay = FetchPay;
    final lOther$FetchPay = other.FetchPay;
    if (l$FetchPay != lOther$FetchPay) {
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

  TRes call({Query$FetchPay$FetchPay? FetchPay, String? $__typename});
  CopyWith$Query$FetchPay$FetchPay<TRes> get FetchPay;
}

class _CopyWithImpl$Query$FetchPay<TRes>
    implements CopyWith$Query$FetchPay<TRes> {
  _CopyWithImpl$Query$FetchPay(this._instance, this._then);

  final Query$FetchPay _instance;

  final TRes Function(Query$FetchPay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? FetchPay = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchPay(
      FetchPay: FetchPay == _undefined
          ? _instance.FetchPay
          : (FetchPay as Query$FetchPay$FetchPay?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$FetchPay$FetchPay<TRes> get FetchPay {
    final local$FetchPay = _instance.FetchPay;
    return local$FetchPay == null
        ? CopyWith$Query$FetchPay$FetchPay.stub(_then(_instance))
        : CopyWith$Query$FetchPay$FetchPay(
            local$FetchPay,
            (e) => call(FetchPay: e),
          );
  }
}

class _CopyWithStubImpl$Query$FetchPay<TRes>
    implements CopyWith$Query$FetchPay<TRes> {
  _CopyWithStubImpl$Query$FetchPay(this._res);

  TRes _res;

  call({Query$FetchPay$FetchPay? FetchPay, String? $__typename}) => _res;

  CopyWith$Query$FetchPay$FetchPay<TRes> get FetchPay =>
      CopyWith$Query$FetchPay$FetchPay.stub(_res);
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
            name: NameNode(value: 'FetchPay'),
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
                  name: NameNode(value: 'hold_request_time'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'pay_capture_time'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'amount_in_cents'),
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

class Query$FetchPay$FetchPay {
  Query$FetchPay$FetchPay({
    this.hold_request_time,
    this.pay_capture_time,
    this.amount_in_cents,
    this.$__typename = 'Pay',
  });

  factory Query$FetchPay$FetchPay.fromJson(Map<String, dynamic> json) {
    final l$hold_request_time = json['hold_request_time'];
    final l$pay_capture_time = json['pay_capture_time'];
    final l$amount_in_cents = json['amount_in_cents'];
    final l$$__typename = json['__typename'];
    return Query$FetchPay$FetchPay(
      hold_request_time: l$hold_request_time == null
          ? null
          : DateTime.parse((l$hold_request_time as String)),
      pay_capture_time: l$pay_capture_time == null
          ? null
          : DateTime.parse((l$pay_capture_time as String)),
      amount_in_cents: (l$amount_in_cents as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime? hold_request_time;

  final DateTime? pay_capture_time;

  final int? amount_in_cents;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hold_request_time = hold_request_time;
    _resultData['hold_request_time'] = l$hold_request_time?.toIso8601String();
    final l$pay_capture_time = pay_capture_time;
    _resultData['pay_capture_time'] = l$pay_capture_time?.toIso8601String();
    final l$amount_in_cents = amount_in_cents;
    _resultData['amount_in_cents'] = l$amount_in_cents;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hold_request_time = hold_request_time;
    final l$pay_capture_time = pay_capture_time;
    final l$amount_in_cents = amount_in_cents;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hold_request_time,
      l$pay_capture_time,
      l$amount_in_cents,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$FetchPay$FetchPay || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hold_request_time = hold_request_time;
    final lOther$hold_request_time = other.hold_request_time;
    if (l$hold_request_time != lOther$hold_request_time) {
      return false;
    }
    final l$pay_capture_time = pay_capture_time;
    final lOther$pay_capture_time = other.pay_capture_time;
    if (l$pay_capture_time != lOther$pay_capture_time) {
      return false;
    }
    final l$amount_in_cents = amount_in_cents;
    final lOther$amount_in_cents = other.amount_in_cents;
    if (l$amount_in_cents != lOther$amount_in_cents) {
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

extension UtilityExtension$Query$FetchPay$FetchPay on Query$FetchPay$FetchPay {
  CopyWith$Query$FetchPay$FetchPay<Query$FetchPay$FetchPay> get copyWith =>
      CopyWith$Query$FetchPay$FetchPay(this, (i) => i);
}

abstract class CopyWith$Query$FetchPay$FetchPay<TRes> {
  factory CopyWith$Query$FetchPay$FetchPay(
    Query$FetchPay$FetchPay instance,
    TRes Function(Query$FetchPay$FetchPay) then,
  ) = _CopyWithImpl$Query$FetchPay$FetchPay;

  factory CopyWith$Query$FetchPay$FetchPay.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchPay$FetchPay;

  TRes call({
    DateTime? hold_request_time,
    DateTime? pay_capture_time,
    int? amount_in_cents,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchPay$FetchPay<TRes>
    implements CopyWith$Query$FetchPay$FetchPay<TRes> {
  _CopyWithImpl$Query$FetchPay$FetchPay(this._instance, this._then);

  final Query$FetchPay$FetchPay _instance;

  final TRes Function(Query$FetchPay$FetchPay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hold_request_time = _undefined,
    Object? pay_capture_time = _undefined,
    Object? amount_in_cents = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$FetchPay$FetchPay(
      hold_request_time: hold_request_time == _undefined
          ? _instance.hold_request_time
          : (hold_request_time as DateTime?),
      pay_capture_time: pay_capture_time == _undefined
          ? _instance.pay_capture_time
          : (pay_capture_time as DateTime?),
      amount_in_cents: amount_in_cents == _undefined
          ? _instance.amount_in_cents
          : (amount_in_cents as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$FetchPay$FetchPay<TRes>
    implements CopyWith$Query$FetchPay$FetchPay<TRes> {
  _CopyWithStubImpl$Query$FetchPay$FetchPay(this._res);

  TRes _res;

  call({
    DateTime? hold_request_time,
    DateTime? pay_capture_time,
    int? amount_in_cents,
    String? $__typename,
  }) => _res;
}
