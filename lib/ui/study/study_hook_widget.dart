import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers.dart';

/// create at 2021/12/30 10:59
/// by githubityu
/// describe：

class StudyHookWidget extends HookWidget {
  const StudyHookWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Consumer(
            builder: (context, ref, child) {
              var time = ref.watch(sessionTimeProvider("sec"));
              return time.when(
                  data: (value) => Text(value),
                  loading: () => const Text("loading"),
                  error: (_, __) => const Text("error"));
            },
          ),
        ),
        title: const Text("============="),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Consumer(
          builder: (context, watch, child) {
            final provider = watch.watch(countryProvider);
            //watch.watch(userListProvider);
            return provider.when(
                data: (data) => Text(data),
                error: (_, error) => Text(error.toString()),
                loading: () => const Text("loading"));
          },
        ),
      ),
    );
  }
}
