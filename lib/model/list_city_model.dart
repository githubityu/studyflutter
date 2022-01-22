import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyflutter/model/city_model.dart';
import 'package:studyflutter/model/news_model.dart';

part 'list_city_model.freezed.dart';

part 'list_city_model.g.dart';

@freezed
class ListCityModel with _$ListCityModel {
  factory ListCityModel({List<CityModel>? list}) = _ListCityModel;

  factory ListCityModel.fromJson(Map<String, dynamic> json) =>
      _$ListCityModelFromJson(json);
}
