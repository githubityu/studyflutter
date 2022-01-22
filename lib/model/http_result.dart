import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_result.freezed.dart';
part 'http_result.g.dart';
@freezed
abstract class HttpResult with _$HttpResult {
  factory HttpResult({
    @JsonKey(name: "state") String? code,
    @JsonKey(name: "message",includeIfNull: true) String? msg,
  }) = _HttpResult;

  factory HttpResult.fromJson(Map<String, dynamic> json) => _$HttpResultFromJson(json);
}
///一般会包含state和data

bool isFromService(Response e){
  final map = e.data as Map<String,dynamic>;
  return map.containsKey("state");
}
