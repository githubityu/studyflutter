import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/simple_data.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/my_text_field.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/async_snapshot.dart';
import 'package:studyflutter/util/extension/number_size.dart';
import 'package:studyflutter/util/utils.dart';
import 'package:studyflutter/viewmodel/zzsy_view_model.dart';

/// create at 2022/1/10 13:41
/// by githubityu
/// describe：

class ZzsyPage extends HookConsumerWidget {
  ZzsyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().e("ZzsyPage=====build");
    final zzsy = ref.watch(zzsyViewModelProvider("0"));

    final loading = ref.watch(loadingStateProvider.notifier);

    final theme = ref.watch(appThemeProvider);

    final data = useFuture(useMemoized(() async {
      return loading.whileLoading(() => zzsy.sourceShow());
    }, []));
    final router = useRouter();
    final codeController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: Constants.isCenterTitle,
        title: const Text(
          "追踪溯源",
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButton(
              onPressed: () async {
                final code = await router.push(ScanCodeRoute());
                Logger().e("code=$code");
                showMsg("code=$code");
              },
              side: BorderSide(color: theme.appColors.accent, width: 1.rpx),
              radius: 5.rpx,
              theme: theme.copyWith(
                  btnBgColor: Colors.transparent,
                  btnTextColor: theme.appColors.accent),
              text: "立刻扫一扫",
            ),
            VSpace.xl,
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    fillColor: Colors.white,
                    filled: true,
                    borderType: 2,
                    key: const Key('code'),
                    controller: codeController,
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    hintText: "请输入商品批号或报告编号",
                    theme: theme,
                  ),
                ),
                HSpace.sm,
                MyButton(
                  minHeight: 48.rpx,
                  minWidth: 100.rpx,
                  onPressed: () {},
                  theme: theme.copyWith(
                      btnTextColor: Colors.black, btnBgColor: Colors.white),
                  text: "确定",
                ),
              ],
            )
          ],
        ),
      ),
      body: ContainerWithLoading(
        child: data.isWaiting || data.data == null
            ? const SizedBox()
            : Container(
                constraints: const BoxConstraints.expand(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "追踪溯源说明：\n\n ${(data.data as Result<SimpleData>).dataOrThrow.content}"),
                ),
              ).clickable(() {
                FocusScope.of(context).unfocus();
              }),
      ),
    );
  }
}
