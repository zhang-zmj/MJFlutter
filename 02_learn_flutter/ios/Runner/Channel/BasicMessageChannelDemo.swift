//
//  BasicMessageChannelDemo.swift
//  Runner
//
//  Created by zmj on 2022/9/8.
//

import UIKit
import Flutter


class BasicMessageChannelDemo: NSObject {

    
    var channel: FlutterBasicMessageChannel!
    var count =  0
    
    init(messenger: FlutterBinaryMessenger) {
        super.init()
        
        //1、Flutter 调用原生，并返回数据
        channel = FlutterBasicMessageChannel(name: "com.example.learnFlutter", binaryMessenger: messenger)
        channel.setMessageHandler { message, reply in
            
            if let dict = message as? Dictionary<String, Any> {
                let name: String = dict["name"] as? String ?? ""
                let age: Int = dict["age"] as? Int ?? 0
                reply(["name": "hello, \(name)", "age": age - 1])
       
            }
            
            self.startTimer()
            
        }
        
        
    }
    
    
   
    func startTimer() {
        Timer.scheduledTimer(timeInterval:1, target: self, selector:#selector(self.tickDown),userInfo:nil,repeats: true)
    }
    
    @objc func tickDown(){
        count += 1
        let args = ["count":count]
        channel.sendMessage(args)
    }


  

}



