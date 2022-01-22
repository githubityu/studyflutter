// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
class _$NewsModelTearOff {
  const _$NewsModelTearOff();

  _NewsModel call({String? pic, String? id, String? name, String? iscoller}) {
    return _NewsModel(
      pic: pic,
      id: id,
      name: name,
      iscoller: iscoller,
    );
  }

  NewsModel fromJson(Map<String, Object?> json) {
    return NewsModel.fromJson(json);
  }
}

/// @nodoc
const $NewsModel = _$NewsModelTearOff();

/// @nodoc
mixin _$NewsModel {
  String? get pic => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iscoller => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res>;
  $Res call({String? pic, String? id, String? name, String? iscoller});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res> implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  final NewsModel _value;
  // ignore: unused_field
  final $Res Function(NewsModel) _then;

  @override
  $Res call({
    Object? pic = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? iscoller = freezed,
  }) {
    return _then(_value.copyWith(
      pic: pic == freezed
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iscoller: iscoller == freezed
          ? _value.iscoller
          : iscoller // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NewsModelCopyWith<$Res> implements $NewsModelCopyWith<$Res> {
  factory _$NewsModelCopyWith(
          _NewsModel value, $Res Function(_NewsModel) then) =
      __$NewsModelCopyWithImpl<$Res>;
  @override
  $Res call({String? pic, String? id, String? name, String? iscoller});
}

/// @nodoc
class __$NewsModelCopyWithImpl<$Res> extends _$NewsModelCopyWithImpl<$Res>
    implements _$NewsModelCopyWith<$Res> {
  __$NewsModelCopyWithImpl(_NewsModel _value, $Res Function(_NewsModel) _then)
      : super(_value, (v) => _then(v as _NewsModel));

  @override
  _NewsModel get _value => super._value as _NewsModel;

  @override
  $Res call({
    Object? pic = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? iscoller = freezed,
  }) {
    return _then(_NewsModel(
      pic: pic == freezed
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iscoller: iscoller == freezed
          ? _value.iscoller
          : iscoller // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsModel implements _NewsModel {
  _$_NewsModel({this.pic, this.id, this.name, this.iscoller});

  factory _$_NewsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewsModelFromJson(json);

  @override
  final String? pic;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? iscoller;

  @override
  String toString() {
    return 'NewsModel(pic: $pic, id: $id, name: $name, iscoller: $iscoller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsModel &&
            const DeepCollectionEquality().equals(other.pic, pic) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.iscoller, iscoller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pic),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(iscoller));

  @JsonKey(ignore: true)
  @override
  _$NewsModelCopyWith<_NewsModel> get copyWith =>
      __$NewsModelCopyWithImpl<_NewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsModelToJson(this);
  }
}

abstract class _NewsModel implements NewsModel {
  factory _NewsModel(
      {String? pic, String? id, String? name, String? iscoller}) = _$_NewsModel;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$_NewsModel.fromJson;

  @override
  String? get pic;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get iscoller;
  @override
  @JsonKey(ignore: true)
  _$NewsModelCopyWith<_NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
