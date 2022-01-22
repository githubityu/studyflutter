import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingStateProvider =
    StateNotifierProvider<LoadingStateViewModel,bool>((ref) => LoadingStateViewModel(false));

class LoadingStateViewModel extends StateNotifier<bool> {
  LoadingStateViewModel(bool state) : super(state);

  Future<dynamic> whileLoading(Future Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toIdle);
  }

  void toLoading() {
    if (state) return;
    state = true;
  }

  void toIdle() {
    if (!state) return;
    state = false;
  }
}
