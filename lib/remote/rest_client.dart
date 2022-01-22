import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/activity_model.dart';
import 'package:studyflutter/model/history_list_model.dart';
import 'package:studyflutter/model/list_city_model.dart';
import 'package:studyflutter/model/new_login_data.dart';
import 'package:studyflutter/model/news_list_model.dart';
import 'package:studyflutter/model/simple_data.dart';

import 'app_dio.dart';

part 'rest_client.g.dart';


HistoryListModel deserializeHistoryListModel(Map<String, dynamic> json) => HistoryListModel.fromJson(json);

@RestApi(baseUrl: Constants.endpoint, parser: Parser.FlutterCompute)
abstract class RestClient  {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('tracesource/history_record')
  Future<HistoryListModel> historyRecord(
    @Query("users_id") String userId,
    @Query("token") String token,
  );

  @GET('tracesource/history_comparative')
  Future<HistoryListModel> historyComparative(
    @Query("users_id") String userId,
    @Query("token") String token,
  );
}
