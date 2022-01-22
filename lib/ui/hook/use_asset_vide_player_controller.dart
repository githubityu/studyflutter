import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useAssetVideoController({
  required String videoRes,
  String? package,
  bool isNet = false,
  bool autoPlay = false,
  bool looping = false,
}) {
  return use(
    _AssetVideoPlayerControllerHook(
      videoRes,
      isNet: isNet,
      package: package,
      autoPlay: autoPlay,
      looping: looping,
      keys: [videoRes, package, isNet,autoPlay, looping],
    ),
  );
}

class _AssetVideoPlayerControllerHook extends Hook<VideoPlayerController>  {
  const _AssetVideoPlayerControllerHook(
    this.videoRes, {
    this.package,
    this.isNet = false,
    required this.autoPlay,
    required this.looping,
    List<Object?>? keys,
  }) : super(keys: keys);

  final String videoRes;
  final bool isNet;
  final String? package;
  final bool autoPlay;
  final bool looping;

  @override
  _AssetVideoPlayerControllerHookState createState() =>
      _AssetVideoPlayerControllerHookState();
}

class _AssetVideoPlayerControllerHookState
    extends HookState<VideoPlayerController, _AssetVideoPlayerControllerHook> {
  late final VideoPlayerController _controller;

  @override
  void initHook() {
    _controller = !hook.isNet
        ? VideoPlayerController.asset(hook.videoRes, package: hook.package)
        : VideoPlayerController.network(hook.videoRes);

    _controller
      ..initialize()
      ..setLooping(hook.looping);

    if (hook.autoPlay) {
      _controller.play();
    }

  }

  @override
  VideoPlayerController build(BuildContext context) => _controller;

  @override
  void dispose(){
    _controller.dispose();
  }
}
