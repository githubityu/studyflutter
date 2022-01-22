import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';

part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  factory CityModel({String? group, String? id, String? name}) =
      _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
