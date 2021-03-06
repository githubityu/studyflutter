// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get cancel {
    return Intl.message(
      'CANCEL',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get signIn {
    return Intl.message(
      'SignIn',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign-In`
  String get googleSignIn {
    return Intl.message(
      'Google Sign-In',
      name: 'googleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign-Out`
  String get googleSignOut {
    return Intl.message(
      'Sign-Out',
      name: 'googleSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error {
    return Intl.message(
      'An error occurred',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Could not get the data`
  String get fetchFailed {
    return Intl.message(
      'Could not get the data',
      name: 'fetchFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get pleaseRetry {
    return Intl.message(
      'Please try again',
      name: 'pleaseRetry',
      desc: '',
      args: [],
    );
  }

  /// `For Empty screen`
  String get noResult {
    return Intl.message(
      'For Empty screen',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `No Title`
  String get noTitle {
    return Intl.message(
      'No Title',
      name: 'noTitle',
      desc: '',
      args: [],
    );
  }

  /// `Display Name`
  String get displayName {
    return Intl.message(
      'Display Name',
      name: 'displayName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `UserId`
  String get uid {
    return Intl.message(
      'UserId',
      name: 'uid',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Deer`
  String get title {
    return Intl.message(
      'Flutter Deer',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get verificationCodeLogin {
    return Intl.message(
      '???????????????',
      name: 'verificationCodeLogin',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get passwordLogin {
    return Intl.message(
      '????????????',
      name: 'passwordLogin',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get login {
    return Intl.message(
      '??????',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get forgotPasswordLink {
    return Intl.message(
      '????????????',
      name: 'forgotPasswordLink',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get inputPasswordHint {
    return Intl.message(
      '???????????????',
      name: 'inputPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get inputUsernameHint {
    return Intl.message(
      '???????????????',
      name: 'inputUsernameHint',
      desc: '',
      args: [],
    );
  }

  /// `???????????????????????????`
  String get noAccountRegisterLink {
    return Intl.message(
      '???????????????????????????',
      name: 'noAccountRegisterLink',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get register {
    return Intl.message(
      '??????',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????`
  String get openYourAccount {
    return Intl.message(
      '??????????????????',
      name: 'openYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????`
  String get inputPhoneHint {
    return Intl.message(
      '??????????????????',
      name: 'inputPhoneHint',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????`
  String get inputVerificationCodeHint {
    return Intl.message(
      '??????????????????',
      name: 'inputVerificationCodeHint',
      desc: '',
      args: [],
    );
  }

  /// `???????????????????????????`
  String get inputPhoneInvalid {
    return Intl.message(
      '???????????????????????????',
      name: 'inputPhoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????????????????????????????`
  String get verificationButton {
    return Intl.message(
      '?????????????????????????????????????????????',
      name: 'verificationButton',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get getVerificationCode {
    return Intl.message(
      '???????????????',
      name: 'getVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get confirm {
    return Intl.message(
      '??????',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????`
  String get resetLoginPassword {
    return Intl.message(
      '??????????????????',
      name: 'resetLoginPassword',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????????????????????????????`
  String get registeredTips {
    return Intl.message(
      '?????????????????????????????????????????????',
      name: 'registeredTips',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
