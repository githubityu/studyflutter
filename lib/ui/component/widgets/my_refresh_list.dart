import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';

/// 封装下拉刷新与加载更多
class DeerListView extends HookConsumerWidget {
  DeerListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onRefresh,
    this.loadMore,
    this.hasMore = false,
    Widget? emptyWidget,
    this.pageSize = 10,
    this.padding,
    this.itemExtent,
  })
      : emptyWidget = emptyWidget ?? const SizedBox.shrink(),
        super(key: key);

  final RefreshCallback onRefresh;
  final LoadMoreCallback? loadMore;
  final int itemCount;
  final bool hasMore;
  final IndexedWidgetBuilder itemBuilder;
  final Widget emptyWidget;

  /// 一页的数量，默认为10
  final int pageSize;

  /// padding属性使用时注意会破坏原有的SafeArea，需要自行计算bottom大小
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;

  bool _isLoading = false;

  Future<void> _loadMore() async {
    if (loadMore == null) {
      return;
    }
    if (_isLoading) {
      return;
    }
    if (!hasMore) {
      return;
    }
    _isLoading = true;
    await loadMore?.call();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final Widget child = RefreshIndicator(
      onRefresh: onRefresh,
      child: Stack(
        children: [
          Visibility(child: emptyWidget, visible: itemCount == 0,),
          ListView.builder(
            itemCount: loadMore == null ? itemCount : itemCount + 1,
            padding: padding,
            itemExtent: itemExtent,
            itemBuilder: (BuildContext context, int index) {
              /// 不需要加载更多则不需要添加FootView
              if (loadMore == null) {
                return itemBuilder(context, index);
              } else {
                return index < itemCount
                    ? itemBuilder(context, index)
                    : MoreWidget(
                  itemCount,
                  hasMore,
                  pageSize,
                  style: theme.textTheme.h40,
                );
              }
            },
          )
        ],
      ),
    );
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification note) {
          /// 确保是垂直方向滚动，且滑动至底部
          if (note.metrics.pixels == note.metrics.maxScrollExtent &&
              note.metrics.axis == Axis.vertical) {
            _loadMore();
          }
          return true;
        },
        child: child,
      ),
    );
  }
}

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class MoreWidget extends StatelessWidget {
  const MoreWidget(this.itemCount, this.hasMore, this.pageSize,
      {Key? key, required this.style})
      : super(key: key);

  final int itemCount;
  final bool hasMore;
  final int pageSize;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (hasMore) const CupertinoActivityIndicator(),
          if (hasMore) HSpace.xl,

          /// 只有一页的时候，就不显示FooterView了
          Text(hasMore ? '正在加载中...' : (itemCount < pageSize ? '' : '没有了呦~'),
              style: style),
        ],
      ),
    );
  }
}
