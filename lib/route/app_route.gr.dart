// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:studyflutter/model/news_model.dart' as _i23;
import 'package:studyflutter/route/check_login.dart' as _i22;
import 'package:studyflutter/ui/base/web_page.dart' as _i5;
import 'package:studyflutter/ui/detail/detail_page.dart' as _i4;
import 'package:studyflutter/ui/home/home_page.dart' as _i16;
import 'package:studyflutter/ui/home/main_page.dart' as _i1;
import 'package:studyflutter/ui/mine/edit_content_page.dart' as _i11;
import 'package:studyflutter/ui/mine/feedback_page.dart' as _i9;
import 'package:studyflutter/ui/mine/mine_page.dart' as _i18;
import 'package:studyflutter/ui/mine/person_info_page.dart' as _i10;
import 'package:studyflutter/ui/mine/scan_result_page.dart' as _i14;
import 'package:studyflutter/ui/mine/select_city_page.dart' as _i12;
import 'package:studyflutter/ui/mine/setting_page.dart' as _i7;
import 'package:studyflutter/ui/mine/update_pwd_page.dart' as _i8;
import 'package:studyflutter/ui/mine/zzsy_history_page2.dart' as _i13;
import 'package:studyflutter/ui/mine/zzsy_history_sub_page.dart' as _i15;
import 'package:studyflutter/ui/news/news_page.dart' as _i19;
import 'package:studyflutter/ui/signIn/login_page.dart' as _i3;
import 'package:studyflutter/ui/signIn/register_page.dart' as _i2;
import 'package:studyflutter/ui/signIn/scan_code_page.dart' as _i6;
import 'package:studyflutter/ui/signIn/zzsy_page.dart' as _i17;

class AppRouter extends _i20.RootStackRouter {
  AppRouter(
      {_i21.GlobalKey<_i21.NavigatorState>? navigatorKey,
      required this.checkLogin})
      : super(navigatorKey);

  final _i22.CheckLogin checkLogin;

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.RegisterPage(args.type, key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i3.LoginPage(),
          fullscreenDialog: true);
    },
    DetailRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DetailRouteArgs>(
          orElse: () => DetailRouteArgs(item: queryParams.get('item')));
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.DetailPage(key: args.key, item: args.item));
    },
    WebRoute.name: (routeData) {
      final args = routeData.argsAs<WebRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.WebPage(args.title, args.url, key: args.key));
    },
    ScanCodeRoute.name: (routeData) {
      final args = routeData.argsAs<ScanCodeRouteArgs>(
          orElse: () => const ScanCodeRouteArgs());
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.ScanCodePage(key: args.key));
    },
    SettingRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.SettingPage());
    },
    UpdatePwdRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.UpdatePwdPage());
    },
    FeedbackRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.FeedbackPage());
    },
    PersonInfoRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.PersonInfoPage());
    },
    EditContentRoute.name: (routeData) {
      final args = routeData.argsAs<EditContentRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.EditContentPage(args.type, key: args.key));
    },
    SelectCityRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.SelectCityPage());
    },
    ZzsyHistoryRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.ZzsyHistoryPage());
    },
    ScanResultRoute.name: (routeData) {
      final args = routeData.argsAs<ScanResultRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i14.ScanResultPage(args.url, key: args.key));
    },
    ZzsyHistorySubRoute.name: (routeData) {
      final args = routeData.argsAs<ZzsyHistorySubRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.ZzsyHistorySubPage(key: args.key, type: args.type));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: _i16.HomePage(key: args.key));
    },
    ZzsyRoute.name: (routeData) {
      final args =
          routeData.argsAs<ZzsyRouteArgs>(orElse: () => const ZzsyRouteArgs());
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: _i17.ZzsyPage(key: args.key));
    },
    MineRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.MinePage());
    },
    NewsRoute.name: (routeData) {
      final args =
          routeData.argsAs<NewsRouteArgs>(orElse: () => const NewsRouteArgs());
      return _i20.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i19.NewsPage(type: args.type, key: args.key));
    }
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(MainRoute.name, path: '/', children: [
          _i20.RouteConfig(HomeRoute.name,
              path: 'homepage',
              parent: MainRoute.name,
              children: [
                _i20.RouteConfig(NewsRoute.name,
                    path: 'newsPage', parent: HomeRoute.name)
              ]),
          _i20.RouteConfig(ZzsyRoute.name,
              path: 'zzsy', parent: MainRoute.name),
          _i20.RouteConfig(MineRoute.name,
              path: 'mine', parent: MainRoute.name, guards: [checkLogin])
        ]),
        _i20.RouteConfig(RegisterRoute.name, path: '/register'),
        _i20.RouteConfig(LoginRoute.name, path: '/loginIn'),
        _i20.RouteConfig(DetailRoute.name, path: '/detail'),
        _i20.RouteConfig(WebRoute.name, path: '/webPage'),
        _i20.RouteConfig(ScanCodeRoute.name, path: '/scanCode'),
        _i20.RouteConfig(SettingRoute.name, path: '/setting'),
        _i20.RouteConfig(UpdatePwdRoute.name, path: '/updatePwd'),
        _i20.RouteConfig(FeedbackRoute.name, path: '/feedback'),
        _i20.RouteConfig(PersonInfoRoute.name, path: '/personInfo'),
        _i20.RouteConfig(EditContentRoute.name, path: '/editContent'),
        _i20.RouteConfig(SelectCityRoute.name, path: '/selectCity'),
        _i20.RouteConfig(ZzsyHistoryRoute.name, path: '/historyPage'),
        _i20.RouteConfig(ScanResultRoute.name, path: '/scanResult'),
        _i20.RouteConfig(ZzsyHistorySubRoute.name, path: '/zzsyHistory')
      ];
}

/// generated route for [_i1.MainPage]
class MainRoute extends _i20.PageRouteInfo<void> {
  const MainRoute({List<_i20.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for [_i2.RegisterPage]
class RegisterRoute extends _i20.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({required int type, _i21.Key? key})
      : super(name,
            path: '/register', args: RegisterRouteArgs(type: type, key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({required this.type, this.key});

  final int type;

  final _i21.Key? key;
}

/// generated route for [_i3.LoginPage]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/loginIn');

  static const String name = 'LoginRoute';
}

/// generated route for [_i4.DetailPage]
class DetailRoute extends _i20.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i21.Key? key, _i23.NewsModel? item})
      : super(name,
            path: '/detail',
            args: DetailRouteArgs(key: key, item: item),
            rawQueryParams: {'item': item});

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, this.item});

  final _i21.Key? key;

  final _i23.NewsModel? item;
}

/// generated route for [_i5.WebPage]
class WebRoute extends _i20.PageRouteInfo<WebRouteArgs> {
  WebRoute({required String title, required String url, _i21.Key? key})
      : super(name,
            path: '/webPage',
            args: WebRouteArgs(title: title, url: url, key: key));

  static const String name = 'WebRoute';
}

class WebRouteArgs {
  const WebRouteArgs({required this.title, required this.url, this.key});

  final String title;

  final String url;

  final _i21.Key? key;
}

/// generated route for [_i6.ScanCodePage]
class ScanCodeRoute extends _i20.PageRouteInfo<ScanCodeRouteArgs> {
  ScanCodeRoute({_i21.Key? key})
      : super(name, path: '/scanCode', args: ScanCodeRouteArgs(key: key));

  static const String name = 'ScanCodeRoute';
}

class ScanCodeRouteArgs {
  const ScanCodeRouteArgs({this.key});

  final _i21.Key? key;
}

/// generated route for [_i7.SettingPage]
class SettingRoute extends _i20.PageRouteInfo<void> {
  const SettingRoute() : super(name, path: '/setting');

  static const String name = 'SettingRoute';
}

/// generated route for [_i8.UpdatePwdPage]
class UpdatePwdRoute extends _i20.PageRouteInfo<void> {
  const UpdatePwdRoute() : super(name, path: '/updatePwd');

  static const String name = 'UpdatePwdRoute';
}

/// generated route for [_i9.FeedbackPage]
class FeedbackRoute extends _i20.PageRouteInfo<void> {
  const FeedbackRoute() : super(name, path: '/feedback');

  static const String name = 'FeedbackRoute';
}

/// generated route for [_i10.PersonInfoPage]
class PersonInfoRoute extends _i20.PageRouteInfo<void> {
  const PersonInfoRoute() : super(name, path: '/personInfo');

  static const String name = 'PersonInfoRoute';
}

/// generated route for [_i11.EditContentPage]
class EditContentRoute extends _i20.PageRouteInfo<EditContentRouteArgs> {
  EditContentRoute({required int type, _i21.Key? key})
      : super(name,
            path: '/editContent',
            args: EditContentRouteArgs(type: type, key: key));

  static const String name = 'EditContentRoute';
}

class EditContentRouteArgs {
  const EditContentRouteArgs({required this.type, this.key});

  final int type;

  final _i21.Key? key;
}

/// generated route for [_i12.SelectCityPage]
class SelectCityRoute extends _i20.PageRouteInfo<void> {
  const SelectCityRoute() : super(name, path: '/selectCity');

  static const String name = 'SelectCityRoute';
}

/// generated route for [_i13.ZzsyHistoryPage]
class ZzsyHistoryRoute extends _i20.PageRouteInfo<void> {
  const ZzsyHistoryRoute() : super(name, path: '/historyPage');

  static const String name = 'ZzsyHistoryRoute';
}

/// generated route for [_i14.ScanResultPage]
class ScanResultRoute extends _i20.PageRouteInfo<ScanResultRouteArgs> {
  ScanResultRoute({required String url, _i21.Key? key})
      : super(name,
            path: '/scanResult', args: ScanResultRouteArgs(url: url, key: key));

  static const String name = 'ScanResultRoute';
}

class ScanResultRouteArgs {
  const ScanResultRouteArgs({required this.url, this.key});

  final String url;

  final _i21.Key? key;
}

/// generated route for [_i15.ZzsyHistorySubPage]
class ZzsyHistorySubRoute extends _i20.PageRouteInfo<ZzsyHistorySubRouteArgs> {
  ZzsyHistorySubRoute({_i21.Key? key, required String type})
      : super(name,
            path: '/zzsyHistory',
            args: ZzsyHistorySubRouteArgs(key: key, type: type));

  static const String name = 'ZzsyHistorySubRoute';
}

class ZzsyHistorySubRouteArgs {
  const ZzsyHistorySubRouteArgs({this.key, required this.type});

  final _i21.Key? key;

  final String type;
}

/// generated route for [_i16.HomePage]
class HomeRoute extends _i20.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i21.Key? key, List<_i20.PageRouteInfo>? children})
      : super(name,
            path: 'homepage',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i21.Key? key;
}

/// generated route for [_i17.ZzsyPage]
class ZzsyRoute extends _i20.PageRouteInfo<ZzsyRouteArgs> {
  ZzsyRoute({_i21.Key? key})
      : super(name, path: 'zzsy', args: ZzsyRouteArgs(key: key));

  static const String name = 'ZzsyRoute';
}

class ZzsyRouteArgs {
  const ZzsyRouteArgs({this.key});

  final _i21.Key? key;
}

/// generated route for [_i18.MinePage]
class MineRoute extends _i20.PageRouteInfo<void> {
  const MineRoute() : super(name, path: 'mine');

  static const String name = 'MineRoute';
}

/// generated route for [_i19.NewsPage]
class NewsRoute extends _i20.PageRouteInfo<NewsRouteArgs> {
  NewsRoute({String? type, _i21.Key? key})
      : super(name,
            path: 'newsPage', args: NewsRouteArgs(type: type, key: key));

  static const String name = 'NewsRoute';
}

class NewsRouteArgs {
  const NewsRouteArgs({this.type, this.key});

  final String? type;

  final _i21.Key? key;
}
