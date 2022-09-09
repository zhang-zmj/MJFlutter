import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      
      // 1.获取FlutterViewController
      let controller: FlutterViewController = window.rootViewController as! FlutterViewController
      
      //2-1、BasicMessageChannel
//     let _ = BasicMessageChannelDemo(messenger: controller.binaryMessenger)
      
      //2-2、MethodChannel
//      let _ = MethodChannelDemo(messenger: controller.binaryMessenger)
      
      
      //2-3、EventChannel
      let _ = EventChannelDemo(messenger: controller.binaryMessenger)
    
      
      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
