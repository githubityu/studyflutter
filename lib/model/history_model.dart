import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';

part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel{
  factory HistoryModel({
    String? classify_code,
    String? my_lot_number,
    String? date,
    String? logo,
    String? force,
    String? kaifeng,
    String? number,
    String? comparative_id,
    String? reporting_unit,
    String? entrusting_unit,
    String? product_trademark,
    String? product_name,
    String? report_date,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
