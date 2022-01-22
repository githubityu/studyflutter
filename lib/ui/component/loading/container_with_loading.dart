import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/ui/component/loading/loading.dart';
import 'package:studyflutter/ui/loading_state_view_model.dart';

class ContainerWithLoading extends ConsumerWidget {
  const ContainerWithLoading({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loadingStateProvider);
    return Stack(children: [
      child,
      state ? const Loading() : const SizedBox.shrink(),
    ]);
  }
}
