import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:studyflutter/model/activity_model.dart';
import 'package:studyflutter/model/history_list_model.dart';
import 'package:studyflutter/model/list_city_model.dart';
import 'package:studyflutter/model/new_login_data.dart';
import 'package:studyflutter/model/news_list_model.dart';
import 'package:studyflutter/model/simple_data.dart';

import 'app_dio.dart';

part 'app_data_source.g.dart';

final appDataSourceProvider = Provider((ref) => AppDataSource(ref.read));

@RestApi()
abstract class AppDataSource {
  factory AppDataSource(Reader reader) => _AppDataSource(reader(dioProvider));

  @GET('api/user/activityList.action')
  Future<List<ActivityModel>> activityList(
      {@Query("accesstoken") required String accesstoken,
      @Query("buserid") required String buserid});

  @POST('login/doLogin')
  @FormUrlEncoded()
  Future<NewLoginData> login(
      {@Field("phone") required String mobile,
      @Field("pwd") required String loginpwd});

  @POST('login/register')
  @FormUrlEncoded()
  Future<NewLoginData> register({
    @Field("phone") required String mobile,
    @Field("pwd") required String loginpwd,
    @Field("code") required String code,
    @Field("qrpwd") required String qrpwd,
  });

  @GET('api/user/signOut.action')
  Future<void> signOut(
      {@Query("accesstoken") required String accesstoken,
      @Query("buserid") required String buserid});

  @GET('login/sendCode')
  Future<void> sendCode(
      {@Query("phone") required String phone,
      @Query("type") required String type});

  @GET('homepage/newsList')
  Future<NewsListModel> newsList(
      {@Query("user_id") required String userId,
      @Query("type") required String type,
      @Query("page") required String page,
      @Query("token") required String token});

  @GET('tracesource/sourceShow')
  Future<SimpleData> sourceShow();

  @POST('login/forgetPassword')
  @FormUrlEncoded()
  Future<void> forgetPassword({
    @Field("phone") required String mobile,
    @Field("pwd") required String loginpwd,
    @Field("code") required String code,
    @Field("qrpwd") required String qrpwd,
  });

  @POST('mehome/updatePwd')
  @FormUrlEncoded()
  Future<void> updatePwd(
    @Field("user_id") String userId,
    @Field("token") String token,
    @Field("oldpwd") String oldpwd,
    @Field("pwd") String pwd,
    @Field("qrpwd") String qrpwd,
  );

  @POST('mehome/feedback')
  @FormUrlEncoded()
  Future<void> feedback(@Field("user_id") String userId,
      @Field("token") String token, @Field("content") String content);

  @POST('mehome/updatePics')
  @MultiPart()
  Future<void> updatePics(
    @Part() List<File>? images,
  );

  @POST('mehome/updateLogo')
  @MultiPart()
  Future<SimpleData> updateLogo(
    @Part() String? user_id,
    @Part() String? token,
    @Part() File logo,
  );

  @GET('mehome/updateName')
  Future<void> updateName(@Query("user_id") String userId,
      @Query("token") String token, @Query("name") String name);

  @GET('login/regionList&type=1')
  Future<ListCityModel> regionList();

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
