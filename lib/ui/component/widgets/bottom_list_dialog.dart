import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/util/extension/number_size.dart';

/// create at 2022/1/13 16:48
/// by githubityu
/// describe：

class BottomListDialog<T> extends HookConsumerWidget {
  final List<T> t;
  final int defaultPos;
  final StackRouter router;
  final AppTheme theme;
  final String title;
  final FixedExtentScrollController controller;

  const BottomListDialog(
    this.t,
    this.controller,
    this.router,
    this.theme, {
    Key? key,
    this.title = "",
    this.defaultPos = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callback = useCallback(
        (Duration timeStamp) => controller.jumpToItem(defaultPos), []);
    useEffect(() {
      if (defaultPos != -1){
        WidgetsBinding.instance?.addPostFrameCallback(callback);
      }
    });
    return SizedBox(
      height: 250.rpx,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "取消",
                  style: theme.textTheme.h40
                      .copyWith(color: theme.appColors.accent),
                ).clickable(() {
                  router.pop();
                }),
                Text(title,
                    style: theme.textTheme.h40
                        .copyWith(color: theme.appColors.accent)),
                Text(
                  "确定",
                  style: theme.textTheme.h40
                      .copyWith(color: theme.appColors.accent),
                ).clickable(() {
                  router.pop();
                })
              ],
            ),
          ),
          SizedBox(
            height: 200.rpx,
            child: ListWheelScrollView.useDelegate(
                controller: controller,
                overAndUnderCenterOpacity: 0.7,
                squeeze: 1,
                useMagnifier: true,
                magnification: 1.5,
                itemExtent: 30.rpx,
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: t.length,
                  builder: (BuildContext context, int index) {
                    return Text("${t[index]}");
                  },
                )),
          )
        ],
      ),
    );
  }
}
