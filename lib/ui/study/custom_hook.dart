import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useCustomHook(AnimationController animationController) =>
    use(_CustomHook(animationController));

class _CustomHook extends Hook<ScrollController> {
  final AnimationController animationController;

  const _CustomHook(this.animationController);

  @override
  _CustomHookState createState() => _CustomHookState();
}

class _CustomHookState extends HookState<ScrollController, _CustomHook> {
  late ScrollController _scrollController;

  @override
  void initHook() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          hook.animationController.forward();
          break;
        case ScrollDirection.reverse:
          hook.animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
        default:
          break;
      }
    });
  }

  @override
  ScrollController build(BuildContext context) {

    return _scrollController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
}
