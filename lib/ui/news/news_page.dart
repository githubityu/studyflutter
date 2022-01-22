import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/generated/l10n.dart';
import 'package:studyflutter/model/news_model.dart';
import 'package:studyflutter/model/page_model.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/component/widgets/my_refresh_list.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/util/extension/async_snapshot.dart';
import 'package:studyflutter/viewmodel/news_view_model.dart';

import 'news_item.dart';

class NewsPage extends HookConsumerWidget {
  final String type;

  const NewsPage({String? type, Key? key})
      : type = type ?? "0",
        super(key: key);

  _buildData(PageModel<List<NewsModel>> news, NewsViewModel prov) {
    return DeerListView(
      emptyWidget: Center(
        child: Text(S().noResult),
      ),
      hasMore: news.hasMore,
      onRefresh: () async {
        final data = prov.getNews(type);
        Logger().e("data=${data.runtimeType}");
        return;
      },
      loadMore: () {
        return prov.getNews(type, isRefresh: false);
      },
      itemCount: news.data.length,
      itemBuilder: (BuildContext context, int index) {
        var item = news.data[index];
        return NewsItem(item);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov = ref.watch(newsViewModelProvider);

    var news =
        ref.watch(newsViewModelProvider.select((value) => value.news[type]));
    final snapshot = useFuture(useMemoized(() {
      return ref
          .watch(loadingStateProvider.notifier)
          .whileLoading(() => prov.getNews(type));
    }, ["news"]));

    return Scaffold(
      body: ContainerWithLoading(
        child: snapshot.isWaiting ? const SizedBox() : _buildData(news!, prov),
      ),
    );
  }
}
