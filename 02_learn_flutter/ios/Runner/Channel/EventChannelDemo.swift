//
//  EventChannelDemo.swift
//  Runner
//
//  Created by zmj on 2022/9/8.
//

import UIKit
import Flutter

class EventChannelDemo: NSObject, FlutterStreamHandler {
    
    var count = 0
   var channel:FlutterEventChannel?

   var timer :Timer!

   var events: FlutterEventSink?
    
    override init() {
       super.init()
    }
    
    convenience init(messenger: FlutterBinaryMessenger) {
        self.init()
        channel = FlutterEventChannel(name: "com.example.learnFlutter", binaryMessenger: messenger)
        channel?.setStreamHandler(self)
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector:#selector(self.tickDown),userInfo:nil,repeats: true)
    }
    
    @objc func tickDown(){
        
        count += 1
        let args = ["count":count]
        if events != nil {
            events!(args)
        }
            
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        
        self.events = events
        return nil
        
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        
        self.events = nil
        self.timer.invalidate()
        self.timer = nil
        return nil
        
    }
    
}
