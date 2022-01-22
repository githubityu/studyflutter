import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/model/activity_model.dart';
import 'package:studyflutter/model/result.dart';

import 'package:studyflutter/remote/app_repository_impl.dart';

final activityListViewModelProvider =
    ChangeNotifierProvider((ref) => ActivityListViewModel(ref.read));

class ActivityListViewModel extends ChangeNotifier {
  ActivityListViewModel(this._reader);

  final Reader _reader;

  late final AppRepositoryImpl _repository = _reader(appRepositoryProvider);

  // Result use case No.1
  Result<List<ActivityModel>>? _activities;

  Result<List<ActivityModel>>? get activities => _activities;

  Future<void> activityList() {
    return _repository
        .activityList()
        .then((value) => _activities = value)
        .whenComplete(notifyListeners);
  }
}
