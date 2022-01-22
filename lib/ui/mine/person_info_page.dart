import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:quiver/strings.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/city_model.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/image/image.dart';
import 'package:studyflutter/ui/component/widgets/bottom_list_dialog.dart';
import 'package:studyflutter/ui/component/widgets/item_option.dart';
import 'package:studyflutter/ui/component/widgets/my_icon.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_fix_controller.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/study/providers.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';

/// create at 2022/1/14 15:42
/// by githubityu
/// describe：

class PersonInfoPage extends HookConsumerWidget {
  const PersonInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    Logger().e("PersonInfoPage=====build");

    var datas = useMemoized(() => List.generate(50, (index) => index + 20));
    final select = useState(-1);
    final controller = useFixedExtentScrollController();

    var sexs = useMemoized(() => ["男", "女"]);
    final sexSelect = useState(0);
    final sexController = useFixedExtentScrollController();

    final city = useState("");

    return Scaffold(
      appBar: AppBar(
        title: const Text("我的资料"),
        centerTitle: Constants.isCenterTitle,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: 10.rpx, horizontal: 15.rpx),
              color: Colors.white,
              height: 80.rpx,
              child: Row(
                children: [
                  const Text("头像"),
                  const Spacer(),
                  CircleAvatar(
                    backgroundImage: profileImageProvider(user.imageUrl),
                    radius: 30.rpx,
                  ),
                  MyIcon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.grey,
                    size: 20,
                    padding: EdgeInsets.only(left: 10.rpx),
                  )
                ],
              ),
            ),
            VSpace.lg,
            ItemOption(
              "昵称",
              endText: user.name,
              theme: theme,
              onTap: () {
                router.push(EditContentRoute(type: 1));
              },
            ),
            ItemOption(
              "年龄",
              endStyle: select.value == -1
                  ? null
                  : theme.textTheme.h40.copyWith(color: Colors.black),
              theme: theme,
              endText: select.value == -1 ? "请选择" : "${datas[select.value]}",
              minVerticalPadding: 0,
              onTap: () async {
                await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return BottomListDialog<int>(
                        datas,
                        controller,
                        router,
                        theme,
                        defaultPos: select.value,
                      );
                    });
                select.value = controller.selectedItem;
              },
            ),
            ItemOption(
              "性别",
              endStyle: sexSelect.value == -1
                  ? null
                  : theme.textTheme.h40.copyWith(color: Colors.black),
              theme: theme,
              endText: sexSelect.value == -1 ? "请选择" : sexs[sexSelect.value],
              minVerticalPadding: 0,
              onTap: () async {
                await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return BottomListDialog<String>(
                        sexs,
                        sexController,
                        router,
                        theme,
                        defaultPos: sexSelect.value,
                        title: "请选择性别",
                      );
                    });
                sexSelect.value = sexController.selectedItem;
              },
            ),
            ItemOption(
              "地区",
              theme: theme,
              endText: isBlank(city.value) ? "请选择" : city.value,
              onTap: () async {
                final data = await router.push(const SelectCityRoute());
                if (data is CityModel) {
                  city.value = "${data.name}";
                }
              },
            ),
            ItemOption(
              "行业",
              theme: theme,
              endText: "请选择",
              onTap: () {
                router.push(EditContentRoute(type: 1));
              },
            ),
            VSpace.lg,
            ItemOption(
              "学校名称",
              theme: theme,
              endText: "学校名称(选填)",
              onTap: () {
                router.push(EditContentRoute(type: 1));
              },
            ),
            ItemOption(
              "专业",
              theme: theme,
              endText: "专业(选填)",
              onTap: () {
                router.push(EditContentRoute(type: 1));
              },
            ),
            ItemOption(
              "企业名称",
              endText: "企业名称(选填)",
              theme: theme,
              onTap: () {
                router.push(EditContentRoute(type: 1));
              },
            ),
            ItemOption(
              "职位",
              endText: "职位(选填)",
              endStyle: theme.textTheme.h40.copyWith(color: Colors.grey),
              theme: theme,
              onTap: () {
                router.push(EditContentRoute(type: 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}
