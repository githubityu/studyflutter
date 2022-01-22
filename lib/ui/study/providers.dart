import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/model/test_model.dart';
import 'package:studyflutter/model/user_info.dart';
import 'package:studyflutter/ui/study/app_api.dart';
import 'package:studyflutter/ui/study/user_info_controller.dart';
import 'package:studyflutter/ui/study/user_list_controller.dart';

final nameProvider = Provider<String>((_) => "ityu");
final indexProvider = StateNotifierProvider<StateController<int>, int>(
    (ref) => StateController(0));

final profileNameProvider =
    FutureProvider<String>((ref) => getProfileUserName(ref.read(nameProvider)));

final countryProvider = FutureProvider<String>((_) => getCountry());

final sessionTimeProvider =
    StreamProvider.family<String, String>((_, units) => getSessionTime(units));

final countryProvider2 = FutureProvider.autoDispose<String>((ref) async {
  String response = await getCountry();
  if (response == "Not found") {
    //保持状态
    ref.maintainState = false;
  } else {
    //保持状态
    ref.maintainState = true;
  }
  String country = response;
  return country;
});

final userListProvider = StateNotifierProvider((_) => UserListController());

final userProvider = StateNotifierProvider<UserinfoController, UserinfoData>(
    (_) => UserinfoController(UserinfoData.instance));


final userProvider2 = StateNotifierProvider<StateController<TestModel>, TestModel>(
        (_) => StateController(TestModel("测试内容",5,false)));