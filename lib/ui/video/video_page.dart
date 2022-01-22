import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/ui/hook/use_asset_vide_player_controller.dart';
import 'package:studyflutter/ui/study/providers.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends HookConsumerWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final videoController = useAssetVideoController(
        // videoRes: Assets.videos.bigbuckbunny,
        videoRes:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        isNet: true,
        autoPlay: true,
        looping: true);
    final indexP = ref.watch(indexProvider.select((value) {
      if(value==0){
         videoController.pause();
      }else{
        videoController.play();
      }
      return value;
    }));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          indexP.toString(),
          style: theme.textTheme.h60.bold().rotunda(),
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(videoController),
        ),
      ),
    );
  }
}
