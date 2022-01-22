class PageModel<T> {
  int page;
  int pageSize;
  T data;
  bool hasMore;

  PageModel(
      {this.page = 1,
      this.pageSize = 10,
      this.hasMore = false,
      required this.data});

  PageModel copyWith() {
    return PageModel(pageSize: pageSize, page: page, data: data);
  }

  @override
  String toString() {
    return 'PageModel{page: $page, pageSize: $pageSize, data: $data, hasMore: $hasMore}';
  }
}
