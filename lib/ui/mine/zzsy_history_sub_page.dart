import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/util/extension/number_size.dart';

/// create at 2022/1/19 13:44
/// by githubityu
/// describe：

class ZzsyHistorySubPage extends HookConsumerWidget {
  final String type;

  const ZzsyHistorySubPage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("标题"),
            floating: true,
            //一直在
            //pinned: true,
            //轻轻以往下拉就出来了
            snap: true,
            expandedHeight: 300,
            //stretchModes flexibleSpace配合使用
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("我是标题"),
              //缩回去的效果 none 不往上走，pin直接往上走，parallax时差效果
              collapseMode: CollapseMode.parallax,
              //向下拉伸的效果
              stretchModes: [StretchMode.blurBackground],
              background: FlutterLogo(),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 50,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 50,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.rpx),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 50,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 15),
              itemExtent: 100)
        ],
      ),
    );
  }
}
