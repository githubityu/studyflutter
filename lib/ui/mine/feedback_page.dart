import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:quiver/strings.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/result.dart';
import 'package:studyflutter/ui/base/base_scrollView_widget.dart';
import 'package:studyflutter/ui/component/widgets/my_button.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/viewmodel/register_view_model.dart';

/// create at 2022/1/12 18:27
/// by githubityu
/// describe：

class FeedbackPage extends HookConsumerWidget with BaseScrollViewWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  void _validation(
      TextEditingController controller, ValueNotifier<bool> _isClick) {
    bool isClick = true;
    final content = controller.text;
    if (isBlank(content)) {
      isClick = false;
    }
    if (_isClick.value != isClick) {
      _isClick.value = isClick;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(registerViewModelProvider);
    final loading = ref.watch(loadingStateProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final controller = useTextEditingController();
    final router = useRouter();
    final number = useState(0);
    final _isClick = useState(false);
    useEffect(() {
      void a() {
        _validation(controller, _isClick);
      }
      controller.addListener(a);
      return () {
        controller.removeListener(a);
      };
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("问题反馈"),
        centerTitle: Constants.isCenterTitle,
        actions: [
          MyButton(
            minWidth: 30,
            onPressed: _isClick.value
                ? () async {
                    final result = await loading
                        .whileLoading(() => provider.feedback(controller.text));
                    if (result is Result && result.isSuccess) {
                      router.pop();
                    }
                  }
                : () {},
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
              VSpace.xl,
              TextField(
                maxLines: 10,
                onChanged: (value) {
                  number.value = value.length;
                },
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    counterText: "${number.value}/500",
                    hintText: "请输入你的宝贵意见，我们将极力改进"),
                key: const Key("content"),
              )
            ],
          )),
    );
  }
}
