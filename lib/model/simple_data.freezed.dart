// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'simple_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleData _$SimpleDataFromJson(Map<String, dynamic> json) {
  return _SimpleData.fromJson(json);
}

/// @nodoc
class _$SimpleDataTearOff {
  const _$SimpleDataTearOff();

  _SimpleData call({String? content, String? logo}) {
    return _SimpleData(
      content: content,
      logo: logo,
    );
  }

  SimpleData fromJson(Map<String, Object?> json) {
    return SimpleData.fromJson(json);
  }
}

/// @nodoc
const $SimpleData = _$SimpleDataTearOff();

/// @nodoc
mixin _$SimpleData {
  String? get content => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleDataCopyWith<SimpleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleDataCopyWith<$Res> {
  factory $SimpleDataCopyWith(
          SimpleData value, $Res Function(SimpleData) then) =
      _$SimpleDataCopyWithImpl<$Res>;
  $Res call({String? content, String? logo});
}

/// @nodoc
class _$SimpleDataCopyWithImpl<$Res> implements $SimpleDataCopyWith<$Res> {
  _$SimpleDataCopyWithImpl(this._value, this._then);

  final SimpleData _value;
  // ignore: unused_field
  final $Res Function(SimpleData) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SimpleDataCopyWith<$Res> implements $SimpleDataCopyWith<$Res> {
  factory _$SimpleDataCopyWith(
          _SimpleData value, $Res Function(_SimpleData) then) =
      __$SimpleDataCopyWithImpl<$Res>;
  @override
  $Res call({String? content, String? logo});
}

/// @nodoc
class __$SimpleDataCopyWithImpl<$Res> extends _$SimpleDataCopyWithImpl<$Res>
    implements _$SimpleDataCopyWith<$Res> {
  __$SimpleDataCopyWithImpl(
      _SimpleData _value, $Res Function(_SimpleData) _then)
      : super(_value, (v) => _then(v as _SimpleData));

  @override
  _SimpleData get _value => super._value as _SimpleData;

  @override
  $Res call({
    Object? content = freezed,
    Object? logo = freezed,
  }) {
    return _then(_SimpleData(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleData implements _SimpleData {
  _$_SimpleData({this.content, this.logo});

  factory _$_SimpleData.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleDataFromJson(json);

  @override
  final String? content;
  @override
  final String? logo;

  @override
  String toString() {
    return 'SimpleData(content: $content, logo: $logo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SimpleData &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.logo, logo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(logo));

  @JsonKey(ignore: true)
  @override
  _$SimpleDataCopyWith<_SimpleData> get copyWith =>
      __$SimpleDataCopyWithImpl<_SimpleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleDataToJson(this);
  }
}

abstract class _SimpleData implements SimpleData {
  factory _SimpleData({String? content, String? logo}) = _$_SimpleData;

  factory _SimpleData.fromJson(Map<String, dynamic> json) =
      _$_SimpleData.fromJson;

  @override
  String? get content;
  @override
  String? get logo;
  @override
  @JsonKey(ignore: true)
  _$SimpleDataCopyWith<_SimpleData> get copyWith =>
      throw _privateConstructorUsedError;
}
