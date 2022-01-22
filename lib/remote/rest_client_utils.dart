import 'package:studyflutter/model/history_list_model.dart';
import 'package:studyflutter/model/user_info.dart';

import 'app_dio.dart';
import 'rest_client.dart';

Future<HistoryListModel> historyComparative() {
  return RestClient(AppDio.getInstance()).historyComparative(
      UserinfoData.instance.id, UserinfoData.instance.token);
}

Future<HistoryListModel> historyRecord() {
  return RestClient(AppDio.getInstance()).historyRecord(
      UserinfoData.instance.id, UserinfoData.instance.token);
}