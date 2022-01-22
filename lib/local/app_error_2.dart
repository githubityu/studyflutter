import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';



class AppError2 implements Exception {
  final String? message;
  final String? erroCode;

  AppError2(this.message, this.erroCode);
}
