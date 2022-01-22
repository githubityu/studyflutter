import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/util/local_data_util.dart';
import 'package:studyflutter/util/size_fit.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';

void main() async {
  await initLocalData();
  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
  if (kIsWeb) {
    // Increase Skia cache size to support bigger images.
    const int megabyte = 1000000;
    SystemChannels.skia.invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
    await Future<void>.delayed(Duration.zero);
  }
  await UserinfoData.getUserinfo();
  SimpleSizeFit.initialize();
  //setPathUrlStrategy();
  runZonedGuarded(() {
    runApp(const ProviderScope(child: App()));
  }, (error, stackTrace) {
    Logger().e("$stackTrace $error");
  });
}
