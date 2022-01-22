import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/generated/l10n.dart';
import 'package:studyflutter/model/history_model.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/component/widgets/my_refresh_list.dart';
import 'package:studyflutter/ui/hook/automatic_keep_alive.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/viewmodel/zzsy_view_model.dart';

import 'zzsy_item_page.dart';

/// create at 2022/1/19 15:54
/// by githubityu
/// describe：

class ZzsyHookPage extends HookConsumerWidget {
  final String type;

  const ZzsyHookPage(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(zzsyViewModelProvider(type));
    final loading = ref.watch(loadingStateProvider.notifier);
    final listDatas =
        ref.watch(zzsyViewModelProvider(type).select((value)=>value.datas1));
    useAutomaticKeepAlive();
    final datas = useFuture(useMemoized(() async {
      return loading.whileLoading(() => provider.historyRecord());
    }, []));

    return ContainerWithLoading(
        child: datas.hasData || listDatas?.isNotEmpty == true
            ? _buildData(listDatas ?? [], () {
                provider.historyRecord();
              }, type)
            : const SizedBox());
  }

  _buildData(
      List<HistoryModel> datas, VoidCallback zzsyViewModel, String type) {
    return DeerListView(
      emptyWidget: Center(
        child: Text(S().noResult),
      ),
      hasMore: false,
      onRefresh: () async {
        zzsyViewModel();
        return;
      },
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) {
        var item = datas[index];
        return ZzsyItemPage(
          item,
          type: type,
        );
      },
    );
  }
}
