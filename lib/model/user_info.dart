import 'package:studyflutter/generated/l10n.dart';
import 'package:studyflutter/model/new_login_data.dart';
import 'package:studyflutter/util/extension/object.dart';
import 'package:studyflutter/util/local_data_util.dart';
import 'package:studyflutter/util/utils.dart';

class UserinfoData {


  static UserinfoData instance = UserinfoData._();


  UserinfoData._();

  String _name = "";
  String _gender = "";
  String _id = "";
  String _token = "";
  String _imageUrl = "";
  String _email = "";
  String _phone = "";
  bool _isLogin = false;

  set id(String value) {
    _id = value;
    putStringForUser("id", value);
  }

  set token(String value) {
    _token = value;
    putStringForUser("token", value);
  }

  set phone(String value) {
    _phone = value;
    putStringForUser("phone", value);
  }

  set imageUrl(String value) {
    _imageUrl = value;
    putStringForUser("imageUrl", value);
  }

  set email(String value) {
    _email = value;
    putStringForUser("email", value);
  }

  set name(String value) {
    _name = value;
    putStringForUser("name", value);
  }

  set gender(String value) {
    _gender = value;
    putStringForUser("gender", value);
  }

  set isLogin(bool value) {
    _isLogin = value;
    putBoolForUser("isLogin", value);
  }

  String get name => _name;

  //设置值并保存到本地
  static void setUserinfo(NewLoginData loginData) {
    UserinfoData.instance.phone = loginData.phone.nullSafe;
    UserinfoData.instance.id = loginData.useId.toString().nullSafe;
    UserinfoData.instance.token = loginData.token.nullSafe;
    UserinfoData.instance.imageUrl = loginData.logo.nullSafe;
    UserinfoData.instance.name = loginData.name.nullSafe;
    UserinfoData.instance.gender = loginData.gender.nullSafe;
    UserinfoData.instance.isLogin = true;
  }

  //从本地读取数据
  static Future getUserinfo() async {
    UserinfoData.instance._phone = getStringForUser("phone");
    UserinfoData.instance._id = getStringForUser("id");
    UserinfoData.instance._isLogin = getBoolForUser("isLogin");
    UserinfoData.instance._name =
        getStringForUser("name", defaultValue: S().displayName);
    UserinfoData.instance._token = getStringForUser("token");
    UserinfoData.instance._email =
        getStringForUser("email", defaultValue: "164098516@qq.com");
    UserinfoData.instance._imageUrl = getStringForUser("imageUrl",
        defaultValue: "https://picsum.photos/200/300?random=1");
    return;
  }

  static void clearUserinfo() {
    UserinfoData.instance.phone = "";
    UserinfoData.instance.id = "";
    UserinfoData.instance.isLogin = false;
    UserinfoData.instance.name = "";
    UserinfoData.instance.token = "";
    UserinfoData.instance.email = "";
    UserinfoData.instance.gender = "";
    UserinfoData.instance.imageUrl = "";
  }

  String get id => _id;

  String get token => _token;

  String get imageUrl => _imageUrl;

  String get email => _email;

  String get phone => _phone;

  String get gender {
    return getSex(_gender);
  }

  bool get isLogin => _isLogin;

  //请先修改值再copy
  UserinfoData copyWidth() {
    instance = UserinfoData._()
      .._name = _name
      .._id = _id
      .._phone = _phone
      .._token = _token
      .._gender = _gender
      .._isLogin = _isLogin
      .._imageUrl = _imageUrl;
    return instance;
  }

  // @override
  // String toString() {
  //   return 'UserinfoData{_name: $_name, _gender: $_gender, _id: $_id, _token: $_token, _imageUrl: $_imageUrl, _email: $_email, _phone: $_phone, _isLogin: $_isLogin}';
  // }
}
