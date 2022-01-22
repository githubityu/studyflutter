import 'package:auto_route/auto_route.dart';
import 'package:studyflutter/model/user_info.dart';

import 'app_route.gr.dart';

class CheckLogin extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (UserinfoData.instance.isLogin) {
      resolver.next(true); // book
    }
    router.push(const LoginRoute());
  }
}
