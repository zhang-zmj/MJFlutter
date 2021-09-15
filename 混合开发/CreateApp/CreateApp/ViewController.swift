//
//  ViewController.swift
//  CreateApp
//
//  Created by zmj on 2021/1/7.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建FlutterViewController
//        let engine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
//        let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
//        flutterVC.view.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width , height: 600)
//        self.view.addSubview(flutterVC.view)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let engine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        flutterVC.modalPresentationStyle = .fullScreen
        present(flutterVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(flutterVC, animated: true)
        
    }

}








