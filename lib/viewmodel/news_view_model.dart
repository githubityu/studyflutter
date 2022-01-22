import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/model/news_model.dart';
import 'package:studyflutter/model/page_model.dart';
import 'package:studyflutter/remote/app_repository_impl.dart';
import 'package:studyflutter/util/utils.dart';

final newsViewModelProvider =
    ChangeNotifierProvider((ref) => NewsViewModel(ref.read));

class NewsViewModel extends ChangeNotifier {
  NewsViewModel(this._reader);

  final Reader _reader;

  late final AppRepositoryImpl _repository = _reader(appRepositoryProvider);

  // Result use case No.1
  final Map<String, PageModel<List<NewsModel>>> _news = {
    "1": PageModel<List<NewsModel>>(data: []),
    "2": PageModel<List<NewsModel>>(data: []),
    "3": PageModel<List<NewsModel>>(data: [])
  };

  Map<String, PageModel<List<NewsModel>>> get news => _news;

  Future<void> getNews(String type, {bool isRefresh = true}) {
    var pageModel = _news[type]!;
    if (isRefresh) {
      pageModel.page = 1;
      pageModel.data.clear();
    }
    return _repository.news(type, pageModel.page).then((value) {
      value.when(success: (value){
        final list = value.list;
        pageModel.hasMore = list!=null&&list.length>=pageModel.pageSize;
        if (list != null) {
          pageModel.data.addAll(list);
        }
        pageModel.page++;
      }, failure: (e){
        pageModel.hasMore =false;
        showMsg(e.message);
      });
      return;
    }).whenComplete(notifyListeners);
  }
}
