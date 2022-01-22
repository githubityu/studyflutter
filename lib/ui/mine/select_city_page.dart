import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/city_model.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/viewmodel/citylist_view_model.dart';

/// create at 2022/1/12 15:38
/// by githubityu
/// describe：

class SelectCityPage extends HookConsumerWidget {
  const SelectCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingStateProvider.notifier);
    final apiP = ref.watch(cityListViewModelProvider);
    final router = useRouter();
    final activities = ref
        .watch(cityListViewModelProvider.select((value) => value.activities));
    final datas = useFuture(useMemoized(() {
      return loading.whileLoading(() async {
        return await apiP.regionList();
      });
    }, []));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("选择城市"),
        centerTitle: Constants.isCenterTitle,
      ),
      body: ContainerWithLoading(
        child: datas.hasData && activities?.list?.isNotEmpty == true
            ? Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        child: const Text("当前城市")),
                    Expanded(
                      child: GroupedListView<CityModel, String>(
                        elements: activities!.list!,
                        groupBy: (element) => "${element.group}",
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        itemComparator: (item1, item2) =>
                            "${item1.group}".compareTo("${item2.group}"),
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        groupSeparatorBuilder: (String value) => Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey[200],
                          child: Text(
                            value.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        itemBuilder: (c, element) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${element.name}"),
                              ),
                              const Divider(),
                            ],
                          ).clickable(() {
                            router.pop(element);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
