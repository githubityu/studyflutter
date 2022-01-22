import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserListController extends StateNotifier<List<String>> {
  UserListController() : super([]);

  void addUser(String user) {
    state = [...state, user];
  }

  void deleteUser(String user) {
    state = state.where((element) => element != user).toList();
  }
}
