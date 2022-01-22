import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/route/app_route.gr.dart';
import 'package:studyflutter/ui/component/widgets/hooks_alert_dialog.dart';
import 'package:studyflutter/ui/component/widgets/item_option.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';

/// create at 2022/1/12 15:38
/// by githubityu
/// describe：

class SettingPage extends HookConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("设置"),
        centerTitle: Constants.isCenterTitle,
      ),
      body: Column(
        children: [
          VSpace.med,
          ItemOption("修改密码", theme: theme, isShowDivider: true, onTap: () {
            router.push(const UpdatePwdRoute());
          }),
          ItemOption(
            "意见反馈",
            theme: theme,
            isShowDivider: true,
            onTap: () {
              router.push(const FeedbackRoute());
            },
          ),
          ItemOption(
            "关于我们",
            theme: theme,
            isShowDivider: true,
          ),
          ItemOption(
            "软件更新",
            theme: theme,
            isShowDivider: true,
          ),
          ItemOption(
            "注销账号",
            theme: theme,
            isShowDivider: true,
            onTap: () {},
          ),
          VSpace.med,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              text: "退出当前账号",
              onPressed: () {
                showDialog(
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        alignment: Alignment.center,
                        title: const UnconstrainedBox(
                          child: Text("确定要退出登录"),
                        ),
                        actions: [
                          MyButton(
                            mainAxisSize: MainAxisSize.min,
                            text: "确定",
                            onPressed: () {
                              UserinfoData.clearUserinfo();
                              router.pushAndPopUntil(const LoginRoute(),
                                  predicate: (router) => false);
                            },
                            theme: theme.copyWith(
                                btnBgColor: Colors.transparent,
                                btnTextColor: theme.appColors.btnBgColor),
                            minWidth: 80,
                            minHeight: 30,
                            side: BorderSide(color: theme.appColors.btnBgColor),
                          ),
                          MyButton(
                            mainAxisSize: MainAxisSize.min,
                            text: "取消",
                            onPressed: () {
                              router.pop();
                            },
                            theme: theme,
                            minWidth: 80,
                            minHeight: 30,
                          ),
                        ],
                      );
                    },
                    context: context);
              },
              theme: theme,
              radius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              text: "请输入密码",
              onPressed: () async {
                final data = await showDialog(
                    builder: (BuildContext context) {
                      return HooksAlertDialog();
                    },
                    context: context);
                Logger().e("$data");
              },
              theme: theme,
              radius: 10,
            ),
          )
        ],
      ),
    );
  }
}
