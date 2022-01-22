import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


/// FlutterTransformer
class FlutterTransformer extends DefaultTransformer {
  FlutterTransformer() : super(jsonDecodeCallback: parseJson);

  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody response,
  ) async {
    //强制用json解析
    response.headers['content-type'] = ['application/json'];
    return super.transformResponse(options, response);
  }
}

final _myJsonCodec = JsonCodec.withReviver((dynamic key, dynamic value) {
  if (value is int || value is double) return "$value";
  return value;
});

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

_parseAndDecode(String response) {
  return _myJsonCodec.decode(response);
}
