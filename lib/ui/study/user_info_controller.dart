import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:studyflutter/model/user_info.dart';

class UserinfoController extends StateNotifier<UserinfoData> {
  UserinfoController(UserinfoData state) : super(state);

  void updateName(String name) {
    state.name = name;
    UserinfoData.instance;
    state = state.copyWidth();
  }

  void updatePic(String pic) {
    state.imageUrl = pic;
    state = state.copyWidth();
  }
}
