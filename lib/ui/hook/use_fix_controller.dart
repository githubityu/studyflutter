import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

FixedExtentScrollController useFixedExtentScrollController({
  int initialItem = 0,
  List<Object?>? keys,
}) {
  return use(
    _FixedExtentScrollControllerHook(initialItem, keys: keys),
  );
}

class _FixedExtentScrollControllerHook
    extends Hook<FixedExtentScrollController> {
  const _FixedExtentScrollControllerHook(
    this.initialItem, {
    List<Object?>? keys,
  }) : super(keys: keys);

  final int initialItem;

  @override
  _FixedExtentScrollControllerHookState createState() =>
      _FixedExtentScrollControllerHookState();
}

class _FixedExtentScrollControllerHookState extends HookState<
    FixedExtentScrollController, _FixedExtentScrollControllerHook> {
  late final FixedExtentScrollController _controller;

  @override
  void initHook() {
    _controller = FixedExtentScrollController(initialItem: hook.initialItem);
  }

  @override
  FixedExtentScrollController build(BuildContext context) => _controller;

  @override
  void dispose() {
    _controller.dispose();
  }
}
