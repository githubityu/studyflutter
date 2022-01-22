// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListCityModel _$$_ListCityModelFromJson(Map<String, dynamic> json) =>
    _$_ListCityModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListCityModelToJson(_$_ListCityModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
