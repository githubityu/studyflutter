import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({String? pic, String? id, String? name, String? iscoller}) =
      _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
