import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/model/history_list_model.dart';
import 'package:studyflutter/model/history_model.dart';
import 'package:studyflutter/model/page_model.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/scan_result_model_entity.dart';
import 'package:studyflutter/model/simple_data.dart';
import 'package:studyflutter/remote/app_repository_impl.dart';
import 'package:studyflutter/util/extension/object.dart';
import 'package:studyflutter/util/utils.dart';

final zzsyViewModelProvider = ChangeNotifierProvider.autoDispose
    .family((ref, String type) => ZzsyViewModel(ref.read, type));

class ZzsyViewModel extends ChangeNotifier {
  final Reader _reader;

  final String type;

  ZzsyViewModel(this._reader, this.type);

  late final AppRepositoryImpl _repository = _reader(appRepositoryProvider);

  List<HistoryModel>? _datas1;

 List<HistoryModel>? get datas1 => _datas1;

  Future<Result<SimpleData>> sourceShow() {
    return _repository.sourceShow().then((value) {
      value.ifSuccess((data) {});
      value.ifFailure((result) {
        showMsg(result.message);
      });
      return value;
    });
  }

  Future<Result<HistoryListModel>> historyRecord() {
    return (type == "0"
            ? _repository.historyRecord()
            : _repository.historyComparative())
        .then((value) {
      value.ifSuccess((data) {
        data.list?.let((dts) {
          _datas1 = dts;
        });
      });
      value.ifFailure((result) {
        showMsg(result.message);
      });
      return value;
    }).whenComplete(notifyListeners);
  }

  // return ScanResultModelEntity.fromJson(res.data);
  Future<ScanResultModelEntity?> tracepro(String url) {
    ScanResultModelEntity? resultModelEntity;
    return _repository.getByUrl(url).then((value) {
      value.when(success: (data) {
        resultModelEntity = ScanResultModelEntity.fromJson(data.data);
      }, failure: (e) {
        showMsg(e.message);
      });
      return resultModelEntity;
    });
  }
}
