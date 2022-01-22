import '../size_fit.dart';

extension DoubleExt on double {
  double get rpx => SimpleSizeFit.setRpx(this)*2;

  double get px => SimpleSizeFit.setPx(this);
}

extension IntExt on int {
  double get rpx => SimpleSizeFit.setRpx(toDouble())*2;

  double get px => SimpleSizeFit.setPx(toDouble());
}
