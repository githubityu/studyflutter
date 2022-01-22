// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewLoginData _$$_NewLoginDataFromJson(Map<String, dynamic> json) =>
    _$_NewLoginData(
      useId: json['user_id'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      token: json['token'] as String?,
      logo: json['logo'] as String?,
      gender: json['gender'] as String?,
      isall: json['isall'] as String?,
    );

Map<String, dynamic> _$$_NewLoginDataToJson(_$_NewLoginData instance) =>
    <String, dynamic>{
      'user_id': instance.useId,
      'phone': instance.phone,
      'name': instance.name,
      'token': instance.token,
      'logo': instance.logo,
      'gender': instance.gender,
      'isall': instance.isall,
    };
