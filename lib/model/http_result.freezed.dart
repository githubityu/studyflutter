// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'http_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HttpResult _$HttpResultFromJson(Map<String, dynamic> json) {
  return _HttpResult.fromJson(json);
}

/// @nodoc
class _$HttpResultTearOff {
  const _$HttpResultTearOff();

  _HttpResult call(
      {@JsonKey(name: "state") String? code,
      @JsonKey(name: "message", includeIfNull: true) String? msg}) {
    return _HttpResult(
      code: code,
      msg: msg,
    );
  }

  HttpResult fromJson(Map<String, Object?> json) {
    return HttpResult.fromJson(json);
  }
}

/// @nodoc
const $HttpResult = _$HttpResultTearOff();

/// @nodoc
mixin _$HttpResult {
  @JsonKey(name: "state")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message", includeIfNull: true)
  String? get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HttpResultCopyWith<HttpResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResultCopyWith<$Res> {
  factory $HttpResultCopyWith(
          HttpResult value, $Res Function(HttpResult) then) =
      _$HttpResultCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "state") String? code,
      @JsonKey(name: "message", includeIfNull: true) String? msg});
}

/// @nodoc
class _$HttpResultCopyWithImpl<$Res> implements $HttpResultCopyWith<$Res> {
  _$HttpResultCopyWithImpl(this._value, this._then);

  final HttpResult _value;
  // ignore: unused_field
  final $Res Function(HttpResult) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HttpResultCopyWith<$Res> implements $HttpResultCopyWith<$Res> {
  factory _$HttpResultCopyWith(
          _HttpResult value, $Res Function(_HttpResult) then) =
      __$HttpResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "state") String? code,
      @JsonKey(name: "message", includeIfNull: true) String? msg});
}

/// @nodoc
class __$HttpResultCopyWithImpl<$Res> extends _$HttpResultCopyWithImpl<$Res>
    implements _$HttpResultCopyWith<$Res> {
  __$HttpResultCopyWithImpl(
      _HttpResult _value, $Res Function(_HttpResult) _then)
      : super(_value, (v) => _then(v as _HttpResult));

  @override
  _HttpResult get _value => super._value as _HttpResult;

  @override
  $Res call({
    Object? code = freezed,
    Object? msg = freezed,
  }) {
    return _then(_HttpResult(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HttpResult with DiagnosticableTreeMixin implements _HttpResult {
  _$_HttpResult(
      {@JsonKey(name: "state") this.code,
      @JsonKey(name: "message", includeIfNull: true) this.msg});

  factory _$_HttpResult.fromJson(Map<String, dynamic> json) =>
      _$$_HttpResultFromJson(json);

  @override
  @JsonKey(name: "state")
  final String? code;
  @override
  @JsonKey(name: "message", includeIfNull: true)
  final String? msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HttpResult(code: $code, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HttpResult'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HttpResult &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$HttpResultCopyWith<_HttpResult> get copyWith =>
      __$HttpResultCopyWithImpl<_HttpResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HttpResultToJson(this);
  }
}

abstract class _HttpResult implements HttpResult {
  factory _HttpResult(
          {@JsonKey(name: "state") String? code,
          @JsonKey(name: "message", includeIfNull: true) String? msg}) =
      _$_HttpResult;

  factory _HttpResult.fromJson(Map<String, dynamic> json) =
      _$_HttpResult.fromJson;

  @override
  @JsonKey(name: "state")
  String? get code;
  @override
  @JsonKey(name: "message", includeIfNull: true)
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$HttpResultCopyWith<_HttpResult> get copyWith =>
      throw _privateConstructorUsedError;
}
