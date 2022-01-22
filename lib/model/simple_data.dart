import 'package:freezed_annotation/freezed_annotation.dart';



part 'simple_data.freezed.dart';

part 'simple_data.g.dart';

@freezed
class SimpleData with _$SimpleData {
  factory SimpleData({
    String? content,
    String? logo,
  }) = _SimpleData;

  factory SimpleData.fromJson(Map<String,dynamic> json) => _$SimpleDataFromJson(json);

}
