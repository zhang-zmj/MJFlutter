//
//  MethodChannelDemo.swift
//  Runner
//
//  Created by zmj on 2022/9/8.
//

import UIKit
import Flutter


class MethodChannelDemo: NSObject {
    
    var channel: FlutterMethodChannel!
    var count = 0
    
    init(messenger: FlutterBinaryMessenger) {
        super.init()
        
        channel = FlutterMethodChannel(name: "com.example.learnFlutter", binaryMessenger: messenger)
        channel.setMethodCallHandler { [self]  call , result in
            if (call.method == "sendData") {
                if let dict = call.arguments as? Dictionary<String, Any> {
                    
                    let name: String = dict["name"] as? String ?? ""
                    let age: Int = dict["age"] as? Int ?? 0
                    result(["name": "hello, \(name)", "age": age - 1])
                }
                
                startTimer()
            }
        }
        
    }
    
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval:1, target: self, selector:#selector(tickDown),userInfo:nil,repeats: true)
    }
    
    @objc func tickDown(){
        count += 1
        let args = ["count":count]
        channel.invokeMethod("timer", arguments: args)
    }
    

}


