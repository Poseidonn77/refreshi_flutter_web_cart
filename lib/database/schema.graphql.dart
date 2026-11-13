import 'package:flutter_webview_cart/database/scalars.dart';

class Input$PlaceOrderInput {
  factory Input$PlaceOrderInput({
    required String id,
    required List<String> items,
    required int amountInCents,
    required DateTime timeSlotStart,
    required DateTime timeSlotEnd,
  }) => Input$PlaceOrderInput._({
    r'id': id,
    r'items': items,
    r'amountInCents': amountInCents,
    r'timeSlotStart': timeSlotStart,
    r'timeSlotEnd': timeSlotEnd,
  });

  Input$PlaceOrderInput._(this._$data);

  factory Input$PlaceOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = fromJsonId(l$id);
    final l$items = data['items'];
    result$data['items'] = (l$items as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    final l$amountInCents = data['amountInCents'];
    result$data['amountInCents'] = fromJsonInt(l$amountInCents);
    final l$timeSlotStart = data['timeSlotStart'];
    result$data['timeSlotStart'] = fromJsonIsoDateTime(l$timeSlotStart);
    final l$timeSlotEnd = data['timeSlotEnd'];
    result$data['timeSlotEnd'] = fromJsonIsoDateTime(l$timeSlotEnd);
    return Input$PlaceOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  List<String> get items => (_$data['items'] as List<String>);

  int get amountInCents => (_$data['amountInCents'] as int);

  DateTime get timeSlotStart => (_$data['timeSlotStart'] as DateTime);

  DateTime get timeSlotEnd => (_$data['timeSlotEnd'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = toJsonId(l$id);
    final l$items = items;
    result$data['items'] = l$items.map((e) => e).toList();
    final l$amountInCents = amountInCents;
    result$data['amountInCents'] = toJsonInt(l$amountInCents);
    final l$timeSlotStart = timeSlotStart;
    result$data['timeSlotStart'] = toJsonIsoDateTime(l$timeSlotStart);
    final l$timeSlotEnd = timeSlotEnd;
    result$data['timeSlotEnd'] = toJsonIsoDateTime(l$timeSlotEnd);
    return result$data;
  }

  CopyWith$Input$PlaceOrderInput<Input$PlaceOrderInput> get copyWith =>
      CopyWith$Input$PlaceOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$PlaceOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
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
    final l$amountInCents = amountInCents;
    final lOther$amountInCents = other.amountInCents;
    if (l$amountInCents != lOther$amountInCents) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$items = items;
    final l$amountInCents = amountInCents;
    final l$timeSlotStart = timeSlotStart;
    final l$timeSlotEnd = timeSlotEnd;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$amountInCents,
      l$timeSlotStart,
      l$timeSlotEnd,
    ]);
  }
}

abstract class CopyWith$Input$PlaceOrderInput<TRes> {
  factory CopyWith$Input$PlaceOrderInput(
    Input$PlaceOrderInput instance,
    TRes Function(Input$PlaceOrderInput) then,
  ) = _CopyWithImpl$Input$PlaceOrderInput;

  factory CopyWith$Input$PlaceOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$PlaceOrderInput;

  TRes call({
    String? id,
    List<String>? items,
    int? amountInCents,
    DateTime? timeSlotStart,
    DateTime? timeSlotEnd,
  });
}

class _CopyWithImpl$Input$PlaceOrderInput<TRes>
    implements CopyWith$Input$PlaceOrderInput<TRes> {
  _CopyWithImpl$Input$PlaceOrderInput(this._instance, this._then);

  final Input$PlaceOrderInput _instance;

  final TRes Function(Input$PlaceOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? items = _undefined,
    Object? amountInCents = _undefined,
    Object? timeSlotStart = _undefined,
    Object? timeSlotEnd = _undefined,
  }) => _then(
    Input$PlaceOrderInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (items != _undefined && items != null)
        'items': (items as List<String>),
      if (amountInCents != _undefined && amountInCents != null)
        'amountInCents': (amountInCents as int),
      if (timeSlotStart != _undefined && timeSlotStart != null)
        'timeSlotStart': (timeSlotStart as DateTime),
      if (timeSlotEnd != _undefined && timeSlotEnd != null)
        'timeSlotEnd': (timeSlotEnd as DateTime),
    }),
  );
}

class _CopyWithStubImpl$Input$PlaceOrderInput<TRes>
    implements CopyWith$Input$PlaceOrderInput<TRes> {
  _CopyWithStubImpl$Input$PlaceOrderInput(this._res);

  TRes _res;

  call({
    String? id,
    List<String>? items,
    int? amountInCents,
    DateTime? timeSlotStart,
    DateTime? timeSlotEnd,
  }) => _res;
}

enum Enum$OrderStatus {
  PLACED,
  CONFIRMED,
  OUT_FOR_DELIVERY,
  DELIVERED,
  $unknown;

  factory Enum$OrderStatus.fromJson(String value) =>
      fromJson$Enum$OrderStatus(value);

  String toJson() => toJson$Enum$OrderStatus(this);
}

String toJson$Enum$OrderStatus(Enum$OrderStatus e) {
  switch (e) {
    case Enum$OrderStatus.PLACED:
      return r'PLACED';
    case Enum$OrderStatus.CONFIRMED:
      return r'CONFIRMED';
    case Enum$OrderStatus.OUT_FOR_DELIVERY:
      return r'OUT_FOR_DELIVERY';
    case Enum$OrderStatus.DELIVERED:
      return r'DELIVERED';
    case Enum$OrderStatus.$unknown:
      return r'$unknown';
  }
}

Enum$OrderStatus fromJson$Enum$OrderStatus(String value) {
  switch (value) {
    case r'PLACED':
      return Enum$OrderStatus.PLACED;
    case r'CONFIRMED':
      return Enum$OrderStatus.CONFIRMED;
    case r'OUT_FOR_DELIVERY':
      return Enum$OrderStatus.OUT_FOR_DELIVERY;
    case r'DELIVERED':
      return Enum$OrderStatus.DELIVERED;
    default:
      return Enum$OrderStatus.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
