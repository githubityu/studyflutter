import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/utils.dart';

import 'my_button.dart';
import 'my_text_field.dart';

/// create at 2022/1/13 16:48
/// by githubityu
/// describe：

class HooksAlertDialog extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final errMsg = useState("");
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    // TODO: implement build
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.spaceAround,
      alignment: Alignment.center,
      content: StatefulBuilder(
        builder: (BuildContext context,
            void Function(void Function()) setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTextField(
                theme: theme,
                isInputPwd: true,
                hintText: "请输入密码",
                controller: controller,
              ),
              Text(
                errMsg.value,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          );
        },
      ),
      title: const UnconstrainedBox(
        child: Text("交易密码"),
      ),
      actions: [
        MyButton(
          mainAxisSize: MainAxisSize.min,
          text: "确定",
          onPressed: () {
            errMsg.value = "密码错误";
            showMsg(controller.text);
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
            router.pop(0);
          },
          theme: theme,
          minWidth: 80,
          minHeight: 30,
        ),
      ],
    );
  }


}
 
