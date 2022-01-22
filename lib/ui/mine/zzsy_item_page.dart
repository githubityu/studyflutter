import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/history_model.dart';
import 'package:studyflutter/model/tuple.dart';
import 'package:studyflutter/route/app_route.dart';
import 'package:studyflutter/ui/component/image/image.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/util/extension/number_size.dart';

/// create at 2022/1/19 16:21
/// by githubityu
/// describe：

class ZzsyItemPage extends HookWidget {
  final HistoryModel historyModel;
  final String type;

  const ZzsyItemPage(this.historyModel, {Key? key, String? type})
      : type = type ?? "0",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80.rpx,
            height: 80.rpx,
            child: networkImage(historyModel.logo),
          ),
          Expanded(
            child: Column(
              children: _buildItem(),
            ),
          )
        ],
      ).clickable(() {
        if (type == "0") {
          router.push(ScanResultRoute(
              url: '${Constants.sysResultUrl}${historyModel.my_lot_number}'));
        } else {}
      }),
    );
  }

  List<Widget> _buildItem() {
    final datas = <Tuple>[];
    if (type == "0") {
      datas.add(Tuple.name(first: "产品分类", second: historyModel.classify_code));
      datas.add(Tuple.name(first: "产品批号", second: historyModel.my_lot_number));
      datas.add(Tuple.name(first: "生产日期", second: historyModel.date));
      datas.add(
          Tuple.name(first: "强制报废周期(剩余)", second: "${historyModel.force}天"));
      datas.add(
          Tuple.name(first: "开封后使用时间", second: "${historyModel.kaifeng}天"));
    } else {
      datas
          .add(Tuple.name(first: "出报告单位", second: historyModel.reporting_unit));
      datas
          .add(Tuple.name(first: "委托单位", second: historyModel.entrusting_unit));
      datas.add(
          Tuple.name(first: "产品商标", second: historyModel.product_trademark));
      datas.add(Tuple.name(first: "产品名称", second: historyModel.product_name));
      datas.add(Tuple.name(first: "报告日期", second: historyModel.report_date));
    }
    return datas
        .map((e) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.rpx),
                  child: Text(e.first ?? ""),
                ),
                Expanded(
                    child: Text(
                  e.second ?? "",
                  textAlign: TextAlign.end,
                )),
              ],
            ))
        .toList();
  }
}
