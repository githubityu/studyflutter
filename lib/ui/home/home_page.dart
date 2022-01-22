import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';

class HomePage extends HookConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final titles = ["行业新闻", "安全常识", "事故案例"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    AutoRouter.of(context);
    final tabController = useTabController(initialLength: titles.length);
    return AutoTabsRouter(
      routes: [
        NewsRoute(type: "1"),
        NewsRoute(type: "2"),
        NewsRoute(type: "3")
      ],
      duration: const Duration(milliseconds: 400),
      builder: (context, child, animation) {
        var tabsRouter = context.tabsRouter;
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    var state = ref.read(appThemeModeProvider.notifier);
                    if (state.state == ThemeMode.dark) {
                      state.state = ThemeMode.light;
                    } else {
                      state.state = ThemeMode.dark;
                    }
                  },
                  child: Text("切换模式",
                      style: theme.textTheme.h40.copyWith(color: Colors.red)))
            ],
            centerTitle: Constants.isCenterTitle,
            title: const Text("首页"),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 48.rpx),
              child: Container(
                height: 50.rpx,
                color: Colors.white,
                child: TabBar(
                  onTap: (index) {
                    tabsRouter.setActiveIndex(index);
                  },
                  controller: tabController,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  tabs: titles.map((e) => Text(e)).toList(),
                ),
              ),
            ),
          ),
          body: FadeTransition(child: child, opacity: animation),
        );
      },
    );
  }
}
