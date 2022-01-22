import 'package:flutter/material.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/util/extension/number_size.dart';

import 'zzsy_hook_page.dart';

/// create at 2022/1/19 13:44
/// by githubityu
/// describe：

class ZzsyHistoryPage2 extends StatefulWidget {
  const ZzsyHistoryPage2({Key? key}) : super(key: key);

  @override
  _ZzsyHistoryPage2State createState() => _ZzsyHistoryPage2State();
}

class _ZzsyHistoryPage2State extends State<ZzsyHistoryPage2>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  late final PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    pageController = PageController();
  }

  _buildBg() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 35.rpx,
              alignment: Alignment.center,
              child: Text(
                "产品溯源",
                style: TextStyle(
                  color: controller.index == 0 ? Colors.white : Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  color: controller.index == 0 ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.rpx),
                    bottomLeft: Radius.circular(10.rpx),
                  ),
                  border: const Border.fromBorderSide(
                      BorderSide(width: 1, color: Colors.blue))),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 35.rpx,
              child: Text(
                "检测报告",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: controller.index == 1 ? Colors.white : Colors.blue,
                ),
              ),
              decoration: BoxDecoration(
                  color: controller.index == 1 ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.rpx),
                    bottomRight: Radius.circular(10.rpx),
                  ),
                  border: const Border.fromBorderSide(
                      BorderSide(width: 1, color: Colors.blue))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Constants.isCenterTitle,
        title: const Text("追踪溯源历史记录"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(96.rpx),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.blue,
                  onTap: (index) {
                    pageController.jumpToPage(index);
                    setState(() {});
                  },
                  labelPadding: EdgeInsets.zero,
                  controller: controller,
                  tabs: [
                    Tab(
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "产品溯源",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "检测报告",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _buildBg()
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          controller.animateTo(index);
        },
        children: const [
          ZzsyHookPage("0"),
          ZzsyHookPage("1")
        ],
      ),
    );
  }
}
