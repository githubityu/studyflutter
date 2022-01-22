import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:quiver/strings.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/scan_result_model_entity.dart';
import 'package:studyflutter/model/tuple.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/ui/component/image/image.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/component/widgets/item_option.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';
import 'package:studyflutter/viewmodel/zzsy_view_model.dart';

/// create at 2022/1/19 15:54
/// by githubityu
/// describe：

class ScanResultPage extends HookConsumerWidget {
  final String url;

  const ScanResultPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(zzsyViewModelProvider("0"));
    final loading = ref.watch(loadingStateProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final datas = useFuture(useMemoized(() async {
      return loading.whileLoading(() => provider
          .tracepro("$url&sign=55&users_id=${UserinfoData.instance.id}"));
    }, []));

    return Scaffold(
      appBar:
          AppBar(centerTitle: Constants.isCenterTitle, title: const Text("结果")),
      body: ContainerWithLoading(
          child: datas.hasData
              ? _buildContent(datas.data, theme)
              : const SizedBox()),
    );
  }

  _buildContent(dynamic data, AppTheme theme) {
    Logger().e(data.runtimeType);
    if (data is ScanResultModelEntity) {
      final a = <Tuple>[];
      final a2 = <Tuple>[];
      a.add(Tuple.name(first: "产品分类", second: data.classifyCode));
      a.add(Tuple.name(first: "产品名称", second: data.name));
      a.add(Tuple.name(first: "产品批号", second: data.myLotNumber));
      a.add(Tuple.name(first: "生产日期", second: data.date));
      a.add(Tuple.name(first: "二维码贴票单位", second: data.codeUnit));
      a.add(Tuple.name(first: "推荐行业", second: data.industry));
      a.add(Tuple.name(first: "搜索销售溯源", second: ""));

      a2.add(Tuple.name(first: "公司", second: data.companyList?.companyname));
      a2.add(Tuple.name(first: "品牌", second: data.companyList?.brand));
      a2.add(Tuple.name(first: "网址", second: data.companyList?.url));

      final children = a
          .map((e) => ItemOption(
                e.first,
                theme: theme,
                endText: e.second,
                showRight: isBlank(e.second),
              ))
          .toList();
      final children2 = a2
          .map((e) => ItemOption(
                e.first,
                theme: theme,
                endText: e.second,
                showRight: false,
                endStyle: theme.textTheme.h30.copyWith(
                    color: e.first == "网址" ? Colors.blue : Colors.grey),
              ))
          .toList();

      return SingleChildScrollView(
        child: Column(
          children: [
            ...children,
            VSpace.med,
            Visibility(
              visible: !isBlank(data.invalid),
              child: Text(
                isBlank(data.invalid) ? "" : "注${data.invalid}",
                style: theme.textTheme.h40.copyWith(color: Colors.red),
              ),
            ),
            SizedBox(
              width: 150.rpx,
              child: AspectRatio(
                aspectRatio: 1,
                child: networkImage(data.logo),
              ),
            ),
            Text(
              "点击图片查看更多",
              style: theme.textTheme.h20,
            ),
            VSpace.xs,
            Container(
              padding: EdgeInsets.all(10.rpx),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "公司信息",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.h30.copyWith(color: Colors.blue),
                  )),
                  Expanded(
                      child: Text(
                    "质量溯源",
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            ...children2,
            VSpace.xl,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MyButton(
                    onPressed: () {},
                    theme: theme.copyWith(btnBgColor: Colors.orange),
                    text: "报告对比",
                  ),
                  VSpace.med,
                  MyButton(
                    onPressed: () {},
                    theme: theme,
                    text: "产品反馈",
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
