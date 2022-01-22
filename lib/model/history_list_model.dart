import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyflutter/model/history_model.dart';
import 'package:studyflutter/model/news_model.dart';

part 'history_list_model.freezed.dart';

part 'history_list_model.g.dart';

@freezed
class HistoryListModel with _$HistoryListModel {
  factory HistoryListModel({List<HistoryModel>? list}) = _HistoryListModel;

  factory HistoryListModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryListModelFromJson(json);
}
