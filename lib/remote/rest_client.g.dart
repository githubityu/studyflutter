// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://app.cuppe.org/index.php?r=default/';
  }

  final Dio _dio;

  String? baseUrl;

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
    final value = await compute(deserializeHistoryListModel, _result.data!);
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
    final value = await compute(deserializeHistoryListModel, _result.data!);
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
