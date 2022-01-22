import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/route/app_route.gr.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/my_text_field.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/viewmodel/register_view_model.dart';

/// create at 2022/1/12 17:22
/// by githubityu
/// describe：

class UpdatePwdPage extends HookConsumerWidget {
  const UpdatePwdPage({Key? key}) : super(key: key);

  void _isEmpty(pwd1Controller, pwd2Controller, pwd3Controller, _click) {
    final pwd1 = pwd1Controller.text;
    final pwd2 = pwd2Controller.text;
    final pwd3 = pwd3Controller.text;

    var isClick = true;
    if (pwd1.isEmpty || pwd1.length < 6) {
      isClick = false;
    }
    if (pwd2.isEmpty || pwd2.length < 6) {
      isClick = false;
    }
    if (pwd3.isEmpty) {
      isClick = false;
    }
    if (pwd2 != pwd3) {
      isClick = false;
    }
    if (isClick != _click.value) {
      _click.value = isClick;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pwd1Controller = useTextEditingController();
    final pwd2Controller = useTextEditingController();
    final pwd3Controller = useTextEditingController();
    final theme = ref.watch(appThemeProvider);

    final loading = ref.watch(loadingStateProvider.notifier);
    final provider = ref.watch(registerViewModelProvider);
    final router = useRouter();

    final _click = useState(false);

    useEffect(() {
      pwd1Controller.addListener(() {
        _isEmpty(pwd1Controller, pwd2Controller, pwd3Controller, _click);
      });
      pwd2Controller.addListener(() {
        _isEmpty(pwd1Controller, pwd2Controller, pwd3Controller, _click);
      });
      pwd3Controller.addListener(() {
        _isEmpty(pwd1Controller, pwd2Controller, pwd3Controller, _click);
      });
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text("修改密码"),
        centerTitle: Constants.isCenterTitle,
      ),
      body: ContainerWithLoading(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  VSpace.xl,
                  MyTextField(
                    controller: pwd1Controller,
                    theme: theme,
                    isInputPwd: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "请输入原密码",
                    key: const Key("pwd1"),
                    borderRadius: 5,
                    borderType: 2,
                  ),
                  VSpace.med,
                  MyTextField(
                    controller: pwd2Controller,
                    theme: theme,
                    isInputPwd: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "请输入新密码",
                    key: const Key("pwd2"),
                    borderRadius: 5,
                    borderType: 2,
                  ),
                  VSpace.med,
                  MyTextField(
                    controller: pwd3Controller,
                    theme: theme,
                    isInputPwd: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "请再次输入新密码",
                    key: const Key("pwd3"),
                    borderRadius: 5,
                    borderType: 2,
                  ),
                  VSpace.xl,
                  MyButton(
                    text: "确认",
                    onPressed: _click.value
                        ? () async {
                            final isOk = await loading.whileLoading(() {
                              return provider.updatePwd(
                                  pwd1Controller.text, pwd2Controller.text);
                            });
                            if (isOk is Result && isOk.isSuccess) {
                              UserinfoData.clearUserinfo();
                              router.pushAndPopUntil(const LoginRoute(),
                                  predicate: (d) => false);
                            }
                          }
                        : null,
                    theme: theme,
                    radius: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
