import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/gen/assets.gen.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/route/app_route.gr.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/viewmodel/news_view_model.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().e("MainPage=====build");
    final theme = ref.watch(appThemeProvider);
    var prov = ref.watch(newsViewModelProvider);
    final router = useRouter();
    return AutoTabsScaffold(
      floatingActionButton: IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          prov.getNews("1");
        },
      ),
      routes: [
        HomeRoute(),
        ZzsyRoute(),
        const MineRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            if (index == 2 && !UserinfoData.instance.isLogin) {
              router.push(const LoginRoute());
              return;
            }
            tabsRouter.setActiveIndex(index);
          },
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.news.svg(
                width: 20,
                color: tabsRouter.current.name == HomeRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: "首页",
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.news.svg(
                width: 20,
                color: tabsRouter.current.name == ZzsyRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: "追踪溯源",
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.video.svg(
                width: 20,
                color: tabsRouter.current.name == MineRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: "我的",
            ),
          ],
        );
      },
    );
  }
}
