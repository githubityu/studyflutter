// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsListModel _$$_NewsListModelFromJson(Map<String, dynamic> json) =>
    _$_NewsListModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NewsListModelToJson(_$_NewsListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
