import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/generated/l10n.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/my_text_field.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';
import 'package:studyflutter/util/utils.dart';
import 'package:studyflutter/viewmodel/register_view_model.dart';

class RegisterPage extends HookConsumerWidget {
  final int type;

  const RegisterPage(this.type, {Key? key}) : super(key: key);

  void _verify(_nameController, _vCodeController, _passwordController,
      isChecked, _clickable) {
    final String name = _nameController.text;
    final String vCode = _vCodeController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }
    clickable = clickable && isChecked.value;
    if (clickable != _clickable.value) {
      _clickable.value = clickable;
    }
  }

  void cancel(
    TapGestureRecognizer? recognizer,
    TextEditingController nameController,
    TextEditingController vCodeController,
    TextEditingController passwordController,
    void Function() listener,
  ) {
    recognizer?.dispose();
    nameController.removeListener(listener);
  }

  _buildBody(
    AppTheme theme,
    TextEditingController nameController,
    TextEditingController vCodeController,
    TextEditingController passwordController,
    ValueNotifier<bool> clickable,
    LoadingStateViewModel loading,
    RegisterViewModel api,
    ValueNotifier<bool> isChecked,
    TapGestureRecognizer? recognizer,
    StackRouter router,
    VoidCallback listener,
  ) {
    return <Widget>[
      VSpace.xs,
      MyTextField(
        filled: true,
        fillColor: Colors.white,
        borderType: 2,
        borderRadius: 5,
        key: const Key('phone'),
        controller: nameController,
        maxLength: 11,
        keyboardType: TextInputType.phone,
        hintText: S().inputPhoneHint,
        theme: theme,
      ),
      VSpace.med,
      MyTextField(
        filled: true,
        fillColor: Colors.white,
        borderType: 2,
        borderRadius: 5,
        key: const Key('vcode'),
        controller: vCodeController,
        keyboardType: TextInputType.number,
        getVCode: () async {
          if (nameController.text.length == 11) {
            final isOk = await loading.whileLoading(
                () => api.sendCode(nameController.text, "${type + 1}"));
            return isOk;
          } else {
            showMsg(S().inputPhoneInvalid);
            return false;
          }
        },
        maxLength: 6,
        hintText: S().inputVerificationCodeHint,
        theme: theme,
      ),
      VSpace.med,
      MyTextField(
        filled: true,
        fillColor: Colors.white,
        borderType: 2,
        borderRadius: 5,
        key: const Key('password'),
        keyName: 'password',
        isInputPwd: true,
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        hintText: S().inputPasswordHint,
        theme: theme,
      ),
      VSpace.med,
      Offstage(
        offstage: type != 0,
        child: Row(
          children: [
            SizedBox(
              width: 24.rpx,
              height: 24.rpx,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked.value,
                onChanged: (value) {
                  isChecked.value = value ?? false;
                  //用上面的那个变量
                  listener();
                },
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: RichText(
                  text: TextSpan(
                      style: theme.textTheme.h30.copyWith(color: Colors.black),
                      text: "请仔细阅读",
                      children: [
                    TextSpan(
                      recognizer: recognizer != null
                          ? (recognizer
                            ..onTap = () {
                              router.push(WebRoute(
                                  title: '隐私条款',
                                  url:
                                      "http://app.cuppe.org/index.php?r=default/login/userAgreement"));
                            })
                          : null,
                      text: "隐私协议",
                      style: theme.textTheme.h30
                          .copyWith(color: theme.appColors.accent),
                    )
                  ])),
            )
          ],
        ),
      ),
      VSpace.xl,
      MyButton(
        key: const Key('register'),
        onPressed: clickable.value
            ? () {
                loading.whileLoading(() async {
                  if (type == 0) {
                    return api.register(nameController.text,
                        passwordController.text, vCodeController.text);
                  } else {
                    return api.forgetPassword(nameController.text,
                        passwordController.text, vCodeController.text);
                  }
                }).then((value) {
                  Logger().e("${value.runtimeType}");
                  if (value is Result && value.isSuccess) {
                    if (type == 0) {
                      if (UserinfoData.instance.isLogin) {
                        router.removeUntil((value) {
                          return value.name == HomeRoute.name;
                        });
                      }
                    } else {
                      router.pop();
                    }
                  }
                });
              }
            : null,
        text: type == 0 ? S().register : S().confirm,
        theme: theme,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _clickable = useState(false);
    final theme = ref.watch(appThemeProvider);
    final TextEditingController _nameController = useTextEditingController();
    final TextEditingController _vCodeController = useTextEditingController();
    final TextEditingController _passwordController =
        useTextEditingController();

    TapGestureRecognizer? recognizer;
    final loading = ref.watch(loadingStateProvider.notifier);

    final api = ref.watch(registerViewModelProvider);

    final isChecked = useState(true);
    final router = useRouter();
    final listener = useMemoized(() {
      return () => _verify(_nameController, _vCodeController,
          _passwordController, isChecked, _clickable);
    });

    useEffect(() {
      recognizer = TapGestureRecognizer();
      _nameController.addListener(listener);
      _vCodeController.addListener(listener);
      _passwordController.addListener(listener);
      return () => cancel(recognizer, _nameController, _vCodeController,
          _passwordController, listener);
    }, ["1"]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: Constants.isCenterTitle,
        title: Text(type == 0 ? S().register : S().forgotPasswordLink),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ContainerWithLoading(
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: _buildBody(
                      theme,
                      _nameController,
                      _vCodeController,
                      _passwordController,
                      _clickable,
                      loading,
                      api,
                      isChecked,
                      recognizer,
                      router,
                      listener),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
