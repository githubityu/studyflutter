// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return _ActivityModel.fromJson(json);
}

/// @nodoc
class _$ActivityModelTearOff {
  const _$ActivityModelTearOff();

  _ActivityModel call(
      {String? id,
      String? title,
      String? img,
      String? rewardNum,
      String? startTime,
      String? endTime}) {
    return _ActivityModel(
      id: id,
      title: title,
      img: img,
      rewardNum: rewardNum,
      startTime: startTime,
      endTime: endTime,
    );
  }

  ActivityModel fromJson(Map<String, Object?> json) {
    return ActivityModel.fromJson(json);
  }
}

/// @nodoc
const $ActivityModel = _$ActivityModelTearOff();

/// @nodoc
mixin _$ActivityModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get rewardNum => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityModelCopyWith<ActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityModelCopyWith<$Res> {
  factory $ActivityModelCopyWith(
          ActivityModel value, $Res Function(ActivityModel) then) =
      _$ActivityModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? title,
      String? img,
      String? rewardNum,
      String? startTime,
      String? endTime});
}

/// @nodoc
class _$ActivityModelCopyWithImpl<$Res>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._value, this._then);

  final ActivityModel _value;
  // ignore: unused_field
  final $Res Function(ActivityModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? img = freezed,
    Object? rewardNum = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardNum: rewardNum == freezed
          ? _value.rewardNum
          : rewardNum // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ActivityModelCopyWith<$Res>
    implements $ActivityModelCopyWith<$Res> {
  factory _$ActivityModelCopyWith(
          _ActivityModel value, $Res Function(_ActivityModel) then) =
      __$ActivityModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? title,
      String? img,
      String? rewardNum,
      String? startTime,
      String? endTime});
}

/// @nodoc
class __$ActivityModelCopyWithImpl<$Res>
    extends _$ActivityModelCopyWithImpl<$Res>
    implements _$ActivityModelCopyWith<$Res> {
  __$ActivityModelCopyWithImpl(
      _ActivityModel _value, $Res Function(_ActivityModel) _then)
      : super(_value, (v) => _then(v as _ActivityModel));

  @override
  _ActivityModel get _value => super._value as _ActivityModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? img = freezed,
    Object? rewardNum = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_ActivityModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardNum: rewardNum == freezed
          ? _value.rewardNum
          : rewardNum // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActivityModel implements _ActivityModel {
  _$_ActivityModel(
      {this.id,
      this.title,
      this.img,
      this.rewardNum,
      this.startTime,
      this.endTime});

  factory _$_ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityModelFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? img;
  @override
  final String? rewardNum;
  @override
  final String? startTime;
  @override
  final String? endTime;

  @override
  String toString() {
    return 'ActivityModel(id: $id, title: $title, img: $img, rewardNum: $rewardNum, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivityModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.img, img) &&
            const DeepCollectionEquality().equals(other.rewardNum, rewardNum) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(img),
      const DeepCollectionEquality().hash(rewardNum),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime));

  @JsonKey(ignore: true)
  @override
  _$ActivityModelCopyWith<_ActivityModel> get copyWith =>
      __$ActivityModelCopyWithImpl<_ActivityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivityModelToJson(this);
  }
}

abstract class _ActivityModel implements ActivityModel {
  factory _ActivityModel(
      {String? id,
      String? title,
      String? img,
      String? rewardNum,
      String? startTime,
      String? endTime}) = _$_ActivityModel;

  factory _ActivityModel.fromJson(Map<String, dynamic> json) =
      _$_ActivityModel.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get img;
  @override
  String? get rewardNum;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  @JsonKey(ignore: true)
  _$ActivityModelCopyWith<_ActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
