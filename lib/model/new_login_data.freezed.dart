// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewLoginData _$NewLoginDataFromJson(Map<String, dynamic> json) {
  return _NewLoginData.fromJson(json);
}

/// @nodoc
class _$NewLoginDataTearOff {
  const _$NewLoginDataTearOff();

  _NewLoginData call(
      {@JsonKey(name: 'user_id') String? useId,
      String? phone,
      String? name,
      String? token,
      String? logo,
      String? gender,
      String? isall}) {
    return _NewLoginData(
      useId: useId,
      phone: phone,
      name: name,
      token: token,
      logo: logo,
      gender: gender,
      isall: isall,
    );
  }

  NewLoginData fromJson(Map<String, Object?> json) {
    return NewLoginData.fromJson(json);
  }
}

/// @nodoc
const $NewLoginData = _$NewLoginDataTearOff();

/// @nodoc
mixin _$NewLoginData {
  @JsonKey(name: 'user_id')
  String? get useId => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get isall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewLoginDataCopyWith<NewLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewLoginDataCopyWith<$Res> {
  factory $NewLoginDataCopyWith(
          NewLoginData value, $Res Function(NewLoginData) then) =
      _$NewLoginDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String? useId,
      String? phone,
      String? name,
      String? token,
      String? logo,
      String? gender,
      String? isall});
}

/// @nodoc
class _$NewLoginDataCopyWithImpl<$Res> implements $NewLoginDataCopyWith<$Res> {
  _$NewLoginDataCopyWithImpl(this._value, this._then);

  final NewLoginData _value;
  // ignore: unused_field
  final $Res Function(NewLoginData) _then;

  @override
  $Res call({
    Object? useId = freezed,
    Object? phone = freezed,
    Object? name = freezed,
    Object? token = freezed,
    Object? logo = freezed,
    Object? gender = freezed,
    Object? isall = freezed,
  }) {
    return _then(_value.copyWith(
      useId: useId == freezed
          ? _value.useId
          : useId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isall: isall == freezed
          ? _value.isall
          : isall // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NewLoginDataCopyWith<$Res>
    implements $NewLoginDataCopyWith<$Res> {
  factory _$NewLoginDataCopyWith(
          _NewLoginData value, $Res Function(_NewLoginData) then) =
      __$NewLoginDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String? useId,
      String? phone,
      String? name,
      String? token,
      String? logo,
      String? gender,
      String? isall});
}

/// @nodoc
class __$NewLoginDataCopyWithImpl<$Res> extends _$NewLoginDataCopyWithImpl<$Res>
    implements _$NewLoginDataCopyWith<$Res> {
  __$NewLoginDataCopyWithImpl(
      _NewLoginData _value, $Res Function(_NewLoginData) _then)
      : super(_value, (v) => _then(v as _NewLoginData));

  @override
  _NewLoginData get _value => super._value as _NewLoginData;

  @override
  $Res call({
    Object? useId = freezed,
    Object? phone = freezed,
    Object? name = freezed,
    Object? token = freezed,
    Object? logo = freezed,
    Object? gender = freezed,
    Object? isall = freezed,
  }) {
    return _then(_NewLoginData(
      useId: useId == freezed
          ? _value.useId
          : useId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      isall: isall == freezed
          ? _value.isall
          : isall // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewLoginData implements _NewLoginData {
  _$_NewLoginData(
      {@JsonKey(name: 'user_id') this.useId,
      this.phone,
      this.name,
      this.token,
      this.logo,
      this.gender,
      this.isall});

  factory _$_NewLoginData.fromJson(Map<String, dynamic> json) =>
      _$$_NewLoginDataFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? useId;
  @override
  final String? phone;
  @override
  final String? name;
  @override
  final String? token;
  @override
  final String? logo;
  @override
  final String? gender;
  @override
  final String? isall;

  @override
  String toString() {
    return 'NewLoginData(useId: $useId, phone: $phone, name: $name, token: $token, logo: $logo, gender: $gender, isall: $isall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewLoginData &&
            const DeepCollectionEquality().equals(other.useId, useId) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.isall, isall));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(useId),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(isall));

  @JsonKey(ignore: true)
  @override
  _$NewLoginDataCopyWith<_NewLoginData> get copyWith =>
      __$NewLoginDataCopyWithImpl<_NewLoginData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewLoginDataToJson(this);
  }
}

abstract class _NewLoginData implements NewLoginData {
  factory _NewLoginData(
      {@JsonKey(name: 'user_id') String? useId,
      String? phone,
      String? name,
      String? token,
      String? logo,
      String? gender,
      String? isall}) = _$_NewLoginData;

  factory _NewLoginData.fromJson(Map<String, dynamic> json) =
      _$_NewLoginData.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get useId;
  @override
  String? get phone;
  @override
  String? get name;
  @override
  String? get token;
  @override
  String? get logo;
  @override
  String? get gender;
  @override
  String? get isall;
  @override
  @JsonKey(ignore: true)
  _$NewLoginDataCopyWith<_NewLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}
