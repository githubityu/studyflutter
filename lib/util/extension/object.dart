extension GenericExt<T> on T {
  R let<R>(R Function(T t) transform) => transform(this);

  R? safeCast<R>() => this is R ? (this as R) : null;
}


/// String 空安全处理
extension StringExtension on String? {
  String get nullSafe => this ?? '';
}
