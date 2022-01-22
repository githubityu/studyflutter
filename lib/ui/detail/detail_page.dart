
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/model/activity_model.dart';
import 'package:studyflutter/model/news_model.dart';
import 'package:studyflutter/ui/component/image/image.dart';
import 'package:studyflutter/ui/hook/use_router.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({
    Key? key,
    @QueryParam('item') this.item,
  }) : super(key: key);

  final NewsModel? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(item != null, "item is required.");
    final router = useRouter();
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: item!,
            child: networkImage(item?.pic),
          ),
        ),
        onTap: router.pop,
      ),
    );
  }
}
