import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/model/list_city_model.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/simple_data.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/remote/app_repository_impl.dart';
import 'package:studyflutter/util/utils.dart';

final registerViewModelProvider =
    ChangeNotifierProvider((ref) => RegisterViewModel(ref.read));

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel(this._reader);

  final Reader _reader;

  late final AppRepositoryImpl _repository = _reader(appRepositoryProvider);

  Future<Result> register(String mobile, String loginpwd, String code) {
    return _repository.register(mobile, loginpwd, code).then((value) {
      value.ifSuccess((data) {
        UserinfoData.setUserinfo(data);
      });
      value.ifFailure((result) {
        UserinfoData.clearUserinfo();
        showMsg(result.message);
      });
      return value;
    });
  }

  Future<Result> forgetPassword(String mobile, String loginpwd, String code) {
    return _repository.forgetPassword(mobile, loginpwd, code).then((value) {
      value.ifSuccess((data) {});
      value.ifFailure((result) {
        UserinfoData.clearUserinfo();
        showMsg(result.message);
      });
      return value;
    });
  }

  Future<bool> sendCode(String mobile, String type) {
    return _repository.sendCode(mobile, type).then((result) {
      var isOk = false;
      result.when(
        success: (_) {
          isOk = true;
        },
        failure: (result) {
          isOk = false;
          showMsg(result.message);
        },
      );
      return isOk;
    });
  }

  Future<Result> updatePwd(String oldPwd, String pwd) {
    return _repository.updatePwd(oldPwd, pwd).then((result) {
      result.when(
        success: (_) {},
        failure: (result) {
          showMsg(result.message);
        },
      );
      return result;
    });
  }

  Future<Result> feedback(String content) {
    return _repository.feedback(content).then((result) {
      result.when(
        success: (_) {},
        failure: (result) {
          showMsg(result.message);
        },
      );
      return result;
    });
  }

  Future<SimpleData> updateLogo(File content) {
    return _repository.updateLogo(content).then((result) {
      result.when(
        success: (_) {},
        failure: (result) {
          showMsg(result.message);
        },
      );
      return result.dataOrThrow;
    });
  }
  Future<Result> updateContent(String content,int type) {
    return _repository.updateContent(content,type).then((result) {
      result.when(
        success: (_) {},
        failure: (result) {
          showMsg(result.message);
        },
      );
      return result;
    });
  }

}
