import '../shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return ZMJSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return ZMJSizeFit.setRpx(this.toDouble());
  }
}





