import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studyflutter/gen/assets.gen.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/simple_data.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/image/image.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/component/widgets/item_option.dart';
import 'package:studyflutter/ui/component/widgets/my_icon.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/ui/study/providers.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/util/extension/number_size.dart';
import 'package:studyflutter/util/extension/object.dart';
import 'package:studyflutter/viewmodel/register_view_model.dart';

/// create at 2022/1/10 13:41
/// by githubityu
/// describe：

class MinePage extends HookConsumerWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final user = ref.watch(userProvider);
    final theme = ref.watch(appThemeProvider);
    final _picker = useMemoized(() => ImagePicker());
    final loading = ref.watch(loadingStateProvider.notifier);
    final registerP = ref.watch(registerViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: Constants.isCenterTitle,
        title: const Text(
          "我的",
        ),
      ),
      body: ContainerWithLoading(
        child: Column(
          children: [
            VSpace.med,
            Container(
              padding: EdgeInsets.only(left: 10.rpx, right: 0.rpx),
              color: Colors.white,
              height: 80.rpx,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: profileImageProvider(user.imageUrl),
                    radius: 30.rpx,
                  ).clickable(() {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CupertinoActionSheet(
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () {
                                router.pop();
                              },
                              child: const Text("取消"),
                            ),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () async {
                                  final XFile? file = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  file?.let((t) {
                                    loading.whileLoading(() async {
                                      return registerP.updateLogo(File(t.path));
                                    }).then((value) {
                                      if (value is SimpleData) {
                                        ref
                                            .read(userProvider.notifier)
                                            .updatePic(value.logo ?? "");
                                        router.pop();
                                      }
                                    });
                                  });
                                },
                                child: const Text("相册"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () async {
                                  final XFile? file = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  file?.let((t) {
                                    loading.whileLoading(() async {
                                      return registerP.updateLogo(File(t.path));
                                    }).then((value) {
                                      if (value is SimpleData) {
                                        ref
                                            .read(userProvider.notifier)
                                            .updatePic(value.logo ?? "");
                                        router.pop();
                                      }
                                    });
                                  });
                                },
                                child: const Text("相机"),
                              ),
                            ],
                          );
                        });
                  }),
                  HSpace.med,
                  Expanded(
                    child: Text(user.name).clickable(() {
                      router.push(const PersonInfoRoute());
                    }),
                  ),
                  const MyIcon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.grey,
                    size: 20,
                  )
                ],
              ),
            ),
            VSpace.med,
            ItemOption(
              "追踪溯源历史记录",
              image: Assets.images.icZj.image(width: 30.rpx, height: 30.rpx),
              imageWidth: 30,
              theme: theme,
              onTap: () async {
                router.push(const ZzsyHistoryRoute());
              },
            ),
            ItemOption("我的收藏",
                onTap: (){
                  router.push(ZzsyHistorySubRoute(type: '0'));
                },
                image: MyIcon(
                  FontAwesomeIcons.star,
                  size: 20,
                  padding: EdgeInsets.all(3.rpx),
                  bgColor: Colors.deepPurpleAccent,
                  color: Colors.white,
                ),
                theme: theme),
            ItemOption("我的问题反馈",
                image: MyIcon(
                  FontAwesomeIcons.commentAlt,
                  size: 20,
                  padding: EdgeInsets.all(3.rpx),
                  bgColor: Colors.red,
                  color: Colors.white,
                ),
                theme: theme),
            ItemOption("个体防护标准查看",
                image: MyIcon(
                  FontAwesomeIcons.commentDots,
                  size: 20,
                  padding: EdgeInsets.all(3.rpx),
                  bgColor: Colors.yellow[900],
                  color: Colors.white,
                ),
                theme: theme),
            VSpace.med,
            ItemOption(
              "设置",
              image: MyIcon(
                FontAwesomeIcons.cog,
                size: 20,
                padding: EdgeInsets.all(3.rpx),
                bgColor: Colors.yellow[600],
                color: Colors.white,
              ),
              theme: theme,
              onTap: () {
                router.push(const SettingRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
