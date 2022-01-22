import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers.dart';

/// create at 2021/12/30 10:59
/// by githubityu
/// describe：

class StudyHookWidget2 extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var time = ref.watch(sessionTimeProvider("sec"));
    final provider = ref.watch(countryProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: time.when(
              data: (value) => Text(value),
              loading: () => const Text("loading"),
              error: (_, __) => const Text("error")),
        ),
        title: const Text("============="),
      ),
      body: Container(
        alignment: Alignment.center,
        child: provider.when(
            data: (data) => Text(data),
            error: (_, error) => Text(error.toString()),
            loading: () => const Text("loading")),
      ),
    );
  }
}
