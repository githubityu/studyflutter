// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryListModel _$HistoryListModelFromJson(Map<String, dynamic> json) {
  return _HistoryListModel.fromJson(json);
}

/// @nodoc
class _$HistoryListModelTearOff {
  const _$HistoryListModelTearOff();

  _HistoryListModel call({List<HistoryModel>? list}) {
    return _HistoryListModel(
      list: list,
    );
  }

  HistoryListModel fromJson(Map<String, Object?> json) {
    return HistoryListModel.fromJson(json);
  }
}

/// @nodoc
const $HistoryListModel = _$HistoryListModelTearOff();

/// @nodoc
mixin _$HistoryListModel {
  List<HistoryModel>? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryListModelCopyWith<HistoryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryListModelCopyWith<$Res> {
  factory $HistoryListModelCopyWith(
          HistoryListModel value, $Res Function(HistoryListModel) then) =
      _$HistoryListModelCopyWithImpl<$Res>;
  $Res call({List<HistoryModel>? list});
}

/// @nodoc
class _$HistoryListModelCopyWithImpl<$Res>
    implements $HistoryListModelCopyWith<$Res> {
  _$HistoryListModelCopyWithImpl(this._value, this._then);

  final HistoryListModel _value;
  // ignore: unused_field
  final $Res Function(HistoryListModel) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>?,
    ));
  }
}

/// @nodoc
abstract class _$HistoryListModelCopyWith<$Res>
    implements $HistoryListModelCopyWith<$Res> {
  factory _$HistoryListModelCopyWith(
          _HistoryListModel value, $Res Function(_HistoryListModel) then) =
      __$HistoryListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<HistoryModel>? list});
}

/// @nodoc
class __$HistoryListModelCopyWithImpl<$Res>
    extends _$HistoryListModelCopyWithImpl<$Res>
    implements _$HistoryListModelCopyWith<$Res> {
  __$HistoryListModelCopyWithImpl(
      _HistoryListModel _value, $Res Function(_HistoryListModel) _then)
      : super(_value, (v) => _then(v as _HistoryListModel));

  @override
  _HistoryListModel get _value => super._value as _HistoryListModel;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_HistoryListModel(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HistoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryListModel implements _HistoryListModel {
  _$_HistoryListModel({this.list});

  factory _$_HistoryListModel.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryListModelFromJson(json);

  @override
  final List<HistoryModel>? list;

  @override
  String toString() {
    return 'HistoryListModel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryListModel &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$HistoryListModelCopyWith<_HistoryListModel> get copyWith =>
      __$HistoryListModelCopyWithImpl<_HistoryListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryListModelToJson(this);
  }
}

abstract class _HistoryListModel implements HistoryListModel {
  factory _HistoryListModel({List<HistoryModel>? list}) = _$_HistoryListModel;

  factory _HistoryListModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryListModel.fromJson;

  @override
  List<HistoryModel>? get list;
  @override
  @JsonKey(ignore: true)
  _$HistoryListModelCopyWith<_HistoryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
