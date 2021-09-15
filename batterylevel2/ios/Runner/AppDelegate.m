#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.获取FlutterViewController(是应用程序的默认Controller)
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;

    // 2.获取MethodChannel(方法通道)
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"coderwhy.com/battery"
                                            binaryMessenger:controller.binaryMessenger];
    
    // 3.监听方法调用(会调用传入的回调函数)
    __weak typeof(self) weakSelf = self;
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      // 3.1.判断是否是getBatteryInfo的调用
      if ([@"getBatteryInfo" isEqualToString:call.method]) {
        // 1.iOS中获取信息的方式
        int batteryLevel = [weakSelf getBatteryLevel];
        // 2.如果没有获取到,那么返回给Flutter端一个异常
        if (batteryLevel == -1) {
          result(@(-100));
        } else {
          // 3.通过result将结果回调给Flutter端
          result(@(batteryLevel));
        }
      } else {
        // 3.2.如果调用的是getBatteryInfo的方法, 那么通过封装的另外一个方法实现回调
        result(FlutterMethodNotImplemented);
      }
    }];
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (int)getBatteryLevel {
  // 获取信息的方法
  UIDevice* device = UIDevice.currentDevice;
  device.batteryMonitoringEnabled = YES;
  if (device.batteryState == UIDeviceBatteryStateUnknown) {
    return -1;
  } else {
    return (int)(device.batteryLevel * 100);
  }
}

@end
