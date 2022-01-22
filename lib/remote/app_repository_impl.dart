import 'dart:io';

import 'package:dio/src/response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/model/activity_model.dart';
import 'package:studyflutter/model/history_list_model.dart';
import 'package:studyflutter/model/list_city_model.dart';
import 'package:studyflutter/model/new_login_data.dart';
import 'package:studyflutter/model/news_list_model.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/simple_data.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/remote/app_data_source.dart';
import 'package:studyflutter/remote/app_dio.dart';

final appRepositoryProvider = Provider((ref) => AppRepositoryImpl(ref.read));

class AppRepositoryImpl {
  AppRepositoryImpl(this._reader);

  final Reader _reader;

  late final AppDataSource _dataSource = _reader(appDataSourceProvider);

  Future<Result<List<ActivityModel>>> activityList() {
    return Result.guardFuture(
      () async => await _dataSource.activityList(
          accesstoken: UserinfoData.instance.token,
          buserid: UserinfoData.instance.id),
    );
  }

  Future<Result<NewLoginData>> login(String mobile, String loginpwd) {
    return Result.guardFuture(
      () async => await _dataSource.login(mobile: mobile, loginpwd: loginpwd),
    );
  }

  Future<Result<NewLoginData>> register(
      String mobile, String loginpwd, String code) {
    return Result.guardFuture(
      () async => await _dataSource.register(
          mobile: mobile, loginpwd: loginpwd, code: code, qrpwd: loginpwd),
    );
  }

  Future<Result<void>> forgetPassword(
      String mobile, String loginpwd, String code) {
    return Result.guardFuture(
      () async => await _dataSource.forgetPassword(
          mobile: mobile, loginpwd: loginpwd, code: code, qrpwd: loginpwd),
    );
  }

  Future<Result<void>> updatePwd(String oldPwd, String pwd) {
    return Result.guardFuture(
      () async => await _dataSource.updatePwd(UserinfoData.instance.id,
          UserinfoData.instance.token, oldPwd, pwd, pwd),
    );
  }

  Future<Result<void>> feedback(String content) {
    return Result.guardFuture(
      () async => await _dataSource.feedback(
          UserinfoData.instance.id, UserinfoData.instance.token, content),
    );
  }

  Future<Result<void>> sendCode(
    String mobile,
    String type,
  ) {
    return Result.guardFuture(
        () async => await _dataSource.sendCode(phone: mobile, type: type));
  }

  Future<Result<void>> signOut() {
    return Result.guardFuture(() async => await _dataSource.signOut(
        accesstoken: UserinfoData.instance.token,
        buserid: UserinfoData.instance.id));
  }

  Future<Result<NewsListModel>> news(type, int page) {
    return Result.guardFuture(
      () async => await _dataSource.newsList(
        page: "$page",
        type: type,
        token: UserinfoData.instance.token,
        userId: UserinfoData.instance.id,
      ),
    );
  }

  Future<Result<SimpleData>> sourceShow() {
    return Result.guardFuture(() async => await _dataSource.sourceShow());
  }

  Future<Result<SimpleData>> updateLogo(File file) {
    return Result.guardFuture(() async => await _dataSource.updateLogo(
        UserinfoData.instance.id, UserinfoData.instance.token, file));
  }

  Future<Result<ListCityModel>> regionList() {
    return Result.guardFuture(() async => await _dataSource.regionList());
  }

  Future<Result<void>> updateContent(String content, int type) {
    Future<void> net() async {
      switch (type) {
        default:
          await _dataSource.updateName(
              UserinfoData.instance.id, UserinfoData.instance.token, content);
          break;
      }
    }

    return Result.guardFuture(() async => net());
  }

  Future<Result<HistoryListModel>> historyRecord() {
    return Result.guardFuture(
      () async => await _dataSource.historyRecord(
        UserinfoData.instance.id,
        UserinfoData.instance.token,
      ),
    );
  }

  Future<Result<HistoryListModel>> historyComparative() {
    return Result.guardFuture(
      () async => await _dataSource.historyComparative(
        UserinfoData.instance.id,
        UserinfoData.instance.token,
      ),
    );
  }

  Future<Result<Response>> getByUrl(String url) async {
    return Result.guardFuture(
      () async => await AppDio.getInstance().get(url),
    );
  }
}
