import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/generated/l10n.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/my_text_field.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';
import 'package:studyflutter/util/local_data_util.dart';
import 'package:studyflutter/viewmodel/login_view_model.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  void _verify(_nameController, _passwordController, _clickable) {
    final name = _nameController.text;
    final password = _passwordController.text;
    var clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }
    if (_clickable.value != clickable) {
      _clickable.value = clickable;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final TextEditingController _nameController = useTextEditingController();
    final TextEditingController _passwordController =
        useTextEditingController();

    final appRepository = ref.watch(loginViewModelProvider);

    final loading = ref.watch(loadingStateProvider.notifier);

    var _clickable = useState(false);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
      _nameController.text = getString(Constants.phone);
      _nameController.addListener(() {
        _verify(_nameController, _passwordController, _clickable);
      });
      _passwordController.addListener(() {
        _verify(_nameController, _passwordController, _clickable);
      });
    }, []);

    final router = useRouter();
    return Scaffold(
      appBar: AppBar(
        title: Text(S().login),
        centerTitle: Constants.isCenterTitle,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                router.push(RegisterRoute(type: 0));
              },
              child: Text(
                S().register,
                style: theme.textTheme.h30.copyWith(color: Colors.white),
              ))
        ],
      ),
      body: ContainerWithLoading(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 30.rpx, left: 15.rpx, right: 15.rpx),
                  padding: EdgeInsets.symmetric(horizontal: 15.rpx),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.rpx))),
                  child: Row(
                    children: [
                      const Text("账号"),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: MyTextField(
                          borderType: 3,
                          key: const Key('phone'),
                          controller: _nameController,
                          maxLength: 11,
                          keyboardType: TextInputType.phone,
                          theme: theme,
                          hintText: "请输入手机号码",
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10.rpx, left: 15.rpx, right: 15.rpx),
                  padding: EdgeInsets.symmetric(horizontal: 15.rpx),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.rpx))),
                  child: Row(
                    children: [
                      const Text("密码"),
                      Expanded(
                          child: MyTextField(
                        key: const Key('password'),
                        keyName: 'password',
                        controller: _passwordController,
                        maxLength: 11,
                        keyboardType: TextInputType.visiblePassword,
                        theme: theme,
                        isInputPwd: true,
                        hintText: "请输入密码",
                      ))
                    ],
                  ),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.rpx, horizontal: 15.rpx),
                    child: Text(
                      "忘记密码",
                      style: theme.textTheme.h30,
                    ),
                  ),
                  alignment: Alignment.topRight,
                ).clickable(() {
                  router.push(RegisterRoute(type: 1));
                }),
                Padding(
                  padding: EdgeInsets.all(15.rpx),
                  child: MyButton(
                    onPressed: _clickable.value
                        ? () {
                            loading.whileLoading(() async {
                              return appRepository.login(_nameController.text,
                                  _passwordController.text);
                            }).then((value) {
                              if (UserinfoData.instance.isLogin) {
                                final dt = router.stackData
                                    .where((element) =>
                                        element.name == MainRoute.name)
                                    .toList();
                                if (dt.isEmpty) {
                                  router.push(const MainRoute());
                                } else {
                                  router.pop();
                                }
                              }
                            });
                          }
                        : null,
                    theme: theme,
                    text: "登录",
                  ),
                ),
              ],
            ),
          ).clickable(() {
            FocusScope.of(context).unfocus();
          }),
        ),
      ),
    );
  }
}
