// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryListModel _$$_HistoryListModelFromJson(Map<String, dynamic> json) =>
    _$_HistoryListModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryListModelToJson(_$_HistoryListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
