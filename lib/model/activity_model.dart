import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';

part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel{
  factory ActivityModel({
    String? id,
    String? title,
    String? img,
    String? rewardNum,
    String? startTime,
    String? endTime,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}
