import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/strings.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/model/tuple.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/ui/base/base_scrollView_widget.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/my_text_field.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/study/providers.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/viewmodel/register_view_model.dart';

import '../loading_state_view_model.dart';

/// create at 2022/1/14 15:42
/// by githubityu
/// describe：

class EditContentPage extends HookConsumerWidget with BaseScrollViewWidget {
  final int type;

  const EditContentPage(this.type, {Key? key}) : super(key: key);

  Tuple getPageData(int type) {
    Tuple tuple;
    switch (type) {
      default:
        tuple = Tuple.name(
            first: "修改昵称", second: "请输入昵称", third: UserinfoData.instance.name);
        break;
    }
    return tuple;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingStateProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final provider = ref.watch(registerViewModelProvider);
    final controller = useTextEditingController();
    final router = useRouter();
    final _isClick = useState(false);
    final pageData = useRef(getPageData(type));
    final ve = useCallback(() {
      var click = true;
      final text = controller.text;
      if (isBlank(text)) {
        click = false;
      }
      if (click != _isClick.value) {
        _isClick.value = click;
      }
    }, []);
    useEffect(() {
      controller.addListener(ve);
      controller.text = pageData.value.third;
      return () => controller.removeListener(ve);
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: Text(pageData.value.first),
        centerTitle: Constants.isCenterTitle,
        actions: [
          MyButton(
            minWidth: 30,
            onPressed: _isClick.value
                ? () async {
                    final result = await loading.whileLoading(
                        () => provider.updateContent(controller.text, type));
                    if (result is Result && result.isSuccess) {
                      ref
                          .read(userProvider.notifier)
                          .updateName(controller.text);
                      router.pop();
                    }
                  }
                : () => {},
            theme: theme.copyWith(
                btnBgColor: Colors.transparent,
                btnTextColor: _isClick.value ? Colors.white : Colors.grey),
            text: "提交",
          )
        ],
      ),
      body: buildScrollView(
          context,
          Column(
            children: [
              VSpace.lg,
              MyTextField(
                fillColor: Colors.white,
                filled: true,
                hintText: pageData.value.second,
                controller: controller,
                theme: theme,
                key: const Key("content"),
              )
            ],
          )),
    );
  }
}
