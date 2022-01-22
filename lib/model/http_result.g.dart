// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HttpResult _$$_HttpResultFromJson(Map<String, dynamic> json) =>
    _$_HttpResult(
      code: json['state'] as String?,
      msg: json['message'] as String?,
    );

Map<String, dynamic> _$$_HttpResultToJson(_$_HttpResult instance) =>
    <String, dynamic>{
      'state': instance.code,
      'message': instance.msg,
    };
