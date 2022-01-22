import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/ui/component/loading/container_with_loading.dart';

/// create at 2022/1/12 18:33
/// by githubityu
/// describe：

mixin BaseScrollViewWidget {
  Widget buildScrollView(BuildContext context, Widget child) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ContainerWithLoading(
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
    );
  }
}
