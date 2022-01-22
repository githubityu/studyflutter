// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsListModel _$NewsListModelFromJson(Map<String, dynamic> json) {
  return _NewsListModel.fromJson(json);
}

/// @nodoc
class _$NewsListModelTearOff {
  const _$NewsListModelTearOff();

  _NewsListModel call({List<NewsModel>? list}) {
    return _NewsListModel(
      list: list,
    );
  }

  NewsListModel fromJson(Map<String, Object?> json) {
    return NewsListModel.fromJson(json);
  }
}

/// @nodoc
const $NewsListModel = _$NewsListModelTearOff();

/// @nodoc
mixin _$NewsListModel {
  List<NewsModel>? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsListModelCopyWith<NewsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsListModelCopyWith<$Res> {
  factory $NewsListModelCopyWith(
          NewsListModel value, $Res Function(NewsListModel) then) =
      _$NewsListModelCopyWithImpl<$Res>;
  $Res call({List<NewsModel>? list});
}

/// @nodoc
class _$NewsListModelCopyWithImpl<$Res>
    implements $NewsListModelCopyWith<$Res> {
  _$NewsListModelCopyWithImpl(this._value, this._then);

  final NewsListModel _value;
  // ignore: unused_field
  final $Res Function(NewsListModel) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>?,
    ));
  }
}

/// @nodoc
abstract class _$NewsListModelCopyWith<$Res>
    implements $NewsListModelCopyWith<$Res> {
  factory _$NewsListModelCopyWith(
          _NewsListModel value, $Res Function(_NewsListModel) then) =
      __$NewsListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<NewsModel>? list});
}

/// @nodoc
class __$NewsListModelCopyWithImpl<$Res>
    extends _$NewsListModelCopyWithImpl<$Res>
    implements _$NewsListModelCopyWith<$Res> {
  __$NewsListModelCopyWithImpl(
      _NewsListModel _value, $Res Function(_NewsListModel) _then)
      : super(_value, (v) => _then(v as _NewsListModel));

  @override
  _NewsListModel get _value => super._value as _NewsListModel;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_NewsListModel(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsListModel implements _NewsListModel {
  _$_NewsListModel({this.list});

  factory _$_NewsListModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewsListModelFromJson(json);

  @override
  final List<NewsModel>? list;

  @override
  String toString() {
    return 'NewsListModel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsListModel &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$NewsListModelCopyWith<_NewsListModel> get copyWith =>
      __$NewsListModelCopyWithImpl<_NewsListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsListModelToJson(this);
  }
}

abstract class _NewsListModel implements NewsListModel {
  factory _NewsListModel({List<NewsModel>? list}) = _$_NewsListModel;

  factory _NewsListModel.fromJson(Map<String, dynamic> json) =
      _$_NewsListModel.fromJson;

  @override
  List<NewsModel>? get list;
  @override
  @JsonKey(ignore: true)
  _$NewsListModelCopyWith<_NewsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
