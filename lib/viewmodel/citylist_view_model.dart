import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:studyflutter/model/list_city_model.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/remote/app_repository_impl.dart';

final cityListViewModelProvider =
    ChangeNotifierProvider((ref) => CityListViewModel(ref.read));

class CityListViewModel extends ChangeNotifier {
  CityListViewModel(this._reader);

  final Reader _reader;

  late final AppRepositoryImpl _repository = _reader(appRepositoryProvider);

  // Result use case No.1
  ListCityModel? _activities;

  ListCityModel? get activities => _activities;




  Future<void> regionList() {
    return _repository.regionList().then((value) {
      final oldList = value.dataOrThrow.list;
      final newList = oldList
          ?.map((e) => e.copyWith(
              group: PinyinHelper.getPinyinE("${e.name}",
                      separator: " ",
                      defPinyin: '#',
                      format: PinyinFormat.WITHOUT_TONE)
                  .substring(0, 1)))
          .toList();

      oldList?.clear();
      oldList?.addAll(newList!);
      return  _activities = value.dataOrThrow;
    }).whenComplete(notifyListeners);
  }
}
