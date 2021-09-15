import 'package:favorcate/ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return ZMJSizeFit.setPx(this);
  }

  double get rpx {
    return ZMJSizeFit.setRpx(this);
  }
}
