import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/ui/component/other/sticky_tabbar_delegate.dart';
import 'package:studyflutter/ui/component/widgets/swipe/src/swiper.dart';
import 'package:studyflutter/ui/component/widgets/swipe/src/swiper_control.dart';
import 'package:studyflutter/ui/component/widgets/swipe/src/swiper_pagination.dart';

import 'zzsy_hook_page.dart';

/// create at 2022/1/19 13:44
/// by githubityu
/// describe：

class ZzsyHistoryPage extends HookConsumerWidget {
  const ZzsyHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);
    final pageController = usePageController();
    return Scaffold(
      body: NestedScrollView(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            controller.animateTo(index);
          },
          children: const [ZzsyHookPage("0"), ZzsyHookPage("1")],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              //一直在
              //pinned: true,
              //轻轻以往下拉就出来了
              // snap: true,
              expandedHeight: 200,
              //stretchModes flexibleSpace配合使用
              // stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("我是标题"),
                //缩回去的效果 none 不往上走，pin直接往上走，parallax时差效果
                collapseMode: CollapseMode.parallax,
                //向下拉伸的效果
                stretchModes: [StretchMode.blurBackground],
                background: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      "https://picsum.photos/200/300?random=1",
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 3,
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(),
                ),
              ),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  child: TabBar(
                    labelColor: Colors.black,
                    controller: controller,
                    onTap: (index) {
                      pageController.jumpToPage(index);
                    },
                    tabs: <Widget>[
                      Tab(text: '资讯'),
                      Tab(text: '技术'),
                    ],
                  ),
                ))
          ];
        },
      ),
    );
  }
}
