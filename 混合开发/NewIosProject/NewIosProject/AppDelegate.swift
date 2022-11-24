//
//  AppDelegate.swift
//  NewIosProject
//
//  Created by zmj on 2022/8/13.
//

import UIKit
import Flutter
import FlutterPluginRegistrant
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, FlutterAppLifeCycleProvider {
 
    
    var window: UIWindow?
    var lifeCycleDelegate: FlutterPluginAppLifeCycleDelegate!
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

    override init() {
        self.lifeCycleDelegate = FlutterPluginAppLifeCycleDelegate()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        flutterEngine.run();
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return lifeCycleDelegate.application(application, didFinishLaunchingWithOptions: launchOptions ?? [:])

    }
    
    func rootFlutterViewController() -> FlutterViewController? {
        let viewController = UIApplication.shared.keyWindow?.rootViewController
        if viewController is FlutterViewController {
            return viewController as? FlutterViewController
        }
        return nil
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        lifeCycleDelegate.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        lifeCycleDelegate.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return lifeCycleDelegate.application(app, open: url, options: options)
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return lifeCycleDelegate.application(application, handleOpen: url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return lifeCycleDelegate.application(application, open: url, sourceApplication: sourceApplication!, annotation: annotation)
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        lifeCycleDelegate.application(application, performActionFor: shortcutItem, completionHandler: completionHandler)
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        lifeCycleDelegate.application(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        lifeCycleDelegate.application(application, performFetchWithCompletionHandler: completionHandler)
    }
    
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
        lifeCycleDelegate.add(delegate)
    }

}

