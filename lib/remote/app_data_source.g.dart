// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppDataSource implements AppDataSource {
  _AppDataSource(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ActivityModel>> activityList(
      {required accesstoken, required buserid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'accesstoken': accesstoken,
      r'buserid': buserid
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ActivityModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/user/activityList.action',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ActivityModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<NewLoginData> login({required mobile, required loginpwd}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'phone': mobile, 'pwd': loginpwd};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewLoginData>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'login/doLogin',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewLoginData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NewLoginData> register(
      {required mobile,
      required loginpwd,
      required code,
      required qrpwd}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phone': mobile,
      'pwd': loginpwd,
      'code': code,
      'qrpwd': qrpwd
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewLoginData>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'login/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewLoginData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> signOut({required accesstoken, required buserid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'accesstoken': accesstoken,
      r'buserid': buserid
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'api/user/signOut.action',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> sendCode({required phone, required type}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'phone': phone, r'type': type};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'login/sendCode',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<NewsListModel> newsList(
      {required userId, required type, required page, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'type': type,
      r'page': page,
      r'token': token
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewsListModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'homepage/newsList',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsListModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SimpleData> sourceShow() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SimpleData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'tracesource/sourceShow',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> forgetPassword(
      {required mobile,
      required loginpwd,
      required code,
      required qrpwd}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phone': mobile,
      'pwd': loginpwd,
      'code': code,
      'qrpwd': qrpwd
    };
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'login/forgetPassword',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> updatePwd(userId, token, oldpwd, pwd, qrpwd) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'user_id': userId,
      'token': token,
      'oldpwd': oldpwd,
      'pwd': pwd,
      'qrpwd': qrpwd
    };
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'mehome/updatePwd',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> feedback(userId, token, content) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'user_id': userId, 'token': token, 'content': content};
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'mehome/feedback',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> updatePics(images) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (images != null) {
      _data.files.addAll(images.map((i) => MapEntry(
          'images',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data')
        .compose(_dio.options, 'mehome/updatePics',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<SimpleData> updateLogo(user_id, token, logo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (user_id != null) {
      _data.fields.add(MapEntry('user_id', user_id));
    }
    if (token != null) {
      _data.fields.add(MapEntry('token', token));
    }
    _data.files.add(MapEntry(
        'logo',
        MultipartFile.fromFileSync(logo.path,
            filename: logo.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SimpleData>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, 'mehome/updateLogo',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SimpleData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> updateName(userId, token, name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': userId,
      r'token': token,
      r'name': name
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'mehome/updateName',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<ListCityModel> regionList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListCityModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'login/regionList&type=1',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListCityModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryListModel> historyRecord(userId, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'users_id': userId,
      r'token': token
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryListModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'tracesource/history_record',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryListModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryListModel> historyComparative(userId, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'users_id': userId,
      r'token': token
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryListModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'tracesource/history_comparative',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryListModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
