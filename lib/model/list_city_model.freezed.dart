// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListCityModel _$ListCityModelFromJson(Map<String, dynamic> json) {
  return _ListCityModel.fromJson(json);
}

/// @nodoc
class _$ListCityModelTearOff {
  const _$ListCityModelTearOff();

  _ListCityModel call({List<CityModel>? list}) {
    return _ListCityModel(
      list: list,
    );
  }

  ListCityModel fromJson(Map<String, Object?> json) {
    return ListCityModel.fromJson(json);
  }
}

/// @nodoc
const $ListCityModel = _$ListCityModelTearOff();

/// @nodoc
mixin _$ListCityModel {
  List<CityModel>? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListCityModelCopyWith<ListCityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCityModelCopyWith<$Res> {
  factory $ListCityModelCopyWith(
          ListCityModel value, $Res Function(ListCityModel) then) =
      _$ListCityModelCopyWithImpl<$Res>;
  $Res call({List<CityModel>? list});
}

/// @nodoc
class _$ListCityModelCopyWithImpl<$Res>
    implements $ListCityModelCopyWith<$Res> {
  _$ListCityModelCopyWithImpl(this._value, this._then);

  final ListCityModel _value;
  // ignore: unused_field
  final $Res Function(ListCityModel) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
    ));
  }
}

/// @nodoc
abstract class _$ListCityModelCopyWith<$Res>
    implements $ListCityModelCopyWith<$Res> {
  factory _$ListCityModelCopyWith(
          _ListCityModel value, $Res Function(_ListCityModel) then) =
      __$ListCityModelCopyWithImpl<$Res>;
  @override
  $Res call({List<CityModel>? list});
}

/// @nodoc
class __$ListCityModelCopyWithImpl<$Res>
    extends _$ListCityModelCopyWithImpl<$Res>
    implements _$ListCityModelCopyWith<$Res> {
  __$ListCityModelCopyWithImpl(
      _ListCityModel _value, $Res Function(_ListCityModel) _then)
      : super(_value, (v) => _then(v as _ListCityModel));

  @override
  _ListCityModel get _value => super._value as _ListCityModel;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_ListCityModel(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListCityModel implements _ListCityModel {
  _$_ListCityModel({this.list});

  factory _$_ListCityModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListCityModelFromJson(json);

  @override
  final List<CityModel>? list;

  @override
  String toString() {
    return 'ListCityModel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListCityModel &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$ListCityModelCopyWith<_ListCityModel> get copyWith =>
      __$ListCityModelCopyWithImpl<_ListCityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListCityModelToJson(this);
  }
}

abstract class _ListCityModel implements ListCityModel {
  factory _ListCityModel({List<CityModel>? list}) = _$_ListCityModel;

  factory _ListCityModel.fromJson(Map<String, dynamic> json) =
      _$_ListCityModel.fromJson;

  @override
  List<CityModel>? get list;
  @override
  @JsonKey(ignore: true)
  _$ListCityModelCopyWith<_ListCityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
