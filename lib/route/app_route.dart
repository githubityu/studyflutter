import 'package:auto_route/auto_route.dart';
import 'package:studyflutter/route/check_login.dart';
import 'package:studyflutter/ui/base/web_page.dart';
import 'package:studyflutter/ui/detail/detail_page.dart';
import 'package:studyflutter/ui/home/home_page.dart';
import 'package:studyflutter/ui/home/main_page.dart';
import 'package:studyflutter/ui/mine/edit_content_page.dart';
import 'package:studyflutter/ui/mine/person_info_page.dart';
import 'package:studyflutter/ui/mine/scan_result_page.dart';
import 'package:studyflutter/ui/mine/select_city_page.dart';
import 'package:studyflutter/ui/mine/zzsy_history_page.dart';
import 'package:studyflutter/ui/mine/zzsy_history_page2.dart';
import 'package:studyflutter/ui/mine/zzsy_history_sub_page.dart';
import 'package:studyflutter/ui/mine/zzsy_hook_page.dart';
import 'package:studyflutter/ui/news/news_page.dart';
import 'package:studyflutter/ui/mine/feedback_page.dart';
import 'package:studyflutter/ui/signIn/login_page.dart';
import 'package:studyflutter/ui/mine/mine_page.dart';
import 'package:studyflutter/ui/signIn/register_page.dart';
import 'package:studyflutter/ui/signIn/scan_code_page.dart';
import 'package:studyflutter/ui/mine/setting_page.dart';
import 'package:studyflutter/ui/mine/update_pwd_page.dart';
import 'package:studyflutter/ui/signIn/zzsy_page.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: MainPage,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(
          path: 'homepage',
          page: HomePage,
          children: [
            AutoRoute(
              path: 'newsPage',
              page: NewsPage,
            ),
          ]
        ),
        AutoRoute(
          path: 'zzsy',
          page: ZzsyPage,
        ),
        AutoRoute(
          path: 'mine',
          guards: [CheckLogin],
          page: MinePage,
        ),
      ],
    ),
    AutoRoute(
      path: '/register',
      page: RegisterPage,
    ),
    AutoRoute(
      path: '/loginIn',
      page: LoginPage,
      fullscreenDialog: true,
    ),
    AutoRoute(
      path: '/detail',
      page: DetailPage,
    ),
    AutoRoute(
      path: '/webPage',
      page: WebPage,
    ),
    AutoRoute(
      path: '/scanCode',
      page: ScanCodePage,
    ),
    AutoRoute(
      path: '/setting',
      page: SettingPage,
    ),
    AutoRoute(
      path: '/updatePwd',
      page: UpdatePwdPage,
    ),
    AutoRoute(
      path: '/feedback',
      page: FeedbackPage,
    ),
    AutoRoute(
      path: '/personInfo',
      page: PersonInfoPage,
    ),
    AutoRoute(
      path: '/editContent',
      page: EditContentPage,
    ),
    AutoRoute(
      path: '/selectCity',
      page: SelectCityPage,
    ),  
    AutoRoute(
      path: '/historyPage',
      page: ZzsyHistoryPage,
    ),
    AutoRoute(
      path: '/scanResult',
      page: ScanResultPage,
    ),
    AutoRoute(
      path: '/zzsyHistory',
      page: ZzsyHistorySubPage,
    ),
  ],
)
class $AppRouter {}
