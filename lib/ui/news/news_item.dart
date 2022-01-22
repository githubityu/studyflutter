
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/generated/l10n.dart';
import 'package:studyflutter/model/news_model.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/image/image.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';
import 'package:studyflutter/util/extension/object.dart';
import 'package:studyflutter/util/utils.dart';

class NewsItem extends HookConsumerWidget {
  final NewsModel activityModel;

  const NewsItem(this.activityModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    return Padding(
      padding: EdgeInsets.all(8.rpx),
      child: Row(
        children: [
          InkWell(
            onTap: () => router.push(DetailRoute(item: activityModel)),
            child: Hero(
                tag: activityModel,
                child: SizedBox(
                  height: 60.rpx,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: networkImage(activityModel.pic, fit: BoxFit.cover),
                  ),
                )),
          ),
          Expanded(
            child: InkWell(
              onTap: () => router.push(WebRoute(
                  title: activityModel.name.nullSafe,
                  url: getUrlById(activityModel.id.nullSafe))),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  activityModel.name ?? S().noTitle,
                  style: theme.textTheme.h20.dense(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
