import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studyflutter/model/news_model.dart';

part 'news_list_model.freezed.dart';

part 'news_list_model.g.dart';

@freezed
class NewsListModel with _$NewsListModel {
  factory NewsListModel({List<NewsModel>? list}) = _NewsListModel;

  factory NewsListModel.fromJson(Map<String, dynamic> json) =>
      _$NewsListModelFromJson(json);
}
