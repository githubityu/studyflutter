import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Constants {
  static const String rootUrl = "";
  static const String endpoint = "${rootUrl}index.php?r=default/";
  static const String newsUrl = "${endpoint}homepage/newsShow&id=";
  static const String sysResultUrl =endpoint+"tracesource/code_tracepro&my_lot_number=";


  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';



  static const String theme = 'AppTheme';
  static const String locale = 'locale';
  static const String appTheme = 'appTheme';
  static const bool isCenterTitle = true;




}
