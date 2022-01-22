import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/model/user_info.dart';

import 'package:studyflutter/remote/app_repository_impl.dart';
import 'package:studyflutter/util/utils.dart';

final loginViewModelProvider =
    ChangeNotifierProvider((ref) => LoginViewModel(ref.read));

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._reader);

  final Reader _reader;

  late final AppRepositoryImpl _repository = _reader(appRepositoryProvider);

  UserinfoData? _user = UserinfoData.instance;

  UserinfoData? get user => _user;

  Future<void> login(String mobile, String loginpwd)  {
    return _repository.login(mobile, loginpwd).then((value) => {
          value.ifSuccess((data) {
            UserinfoData.setUserinfo(data);
            _user = UserinfoData.instance;
            notifyListeners();
          }),
          value.ifFailure((result){
            UserinfoData.clearUserinfo();
            _user = null;
            showMsg(result.message);
          })
        });
  }

  Future signOut() {
    return _repository.signOut().then((result) {
      return result.when(
        success: (_) {
          UserinfoData.clearUserinfo();
          _user = null;
          notifyListeners();
        },
        failure: (result) => {
          showMsg(result.message)
        },
      );
    });
  }
}
