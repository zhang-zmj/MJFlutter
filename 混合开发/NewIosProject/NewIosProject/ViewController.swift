//
//  ViewController.swift
//  NewIosProject
//
//  Created by zmj on 2022/8/13.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
       let button = UIButton(type:UIButton.ButtonType.custom)
       button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
       button.setTitle("Show Flutter!", for: UIControl.State.normal)
       button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
       button.backgroundColor = UIColor.blue
       self.view.addSubview(button)
        
    }

    
    @objc func showFlutter() {
        
       let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
       let flutterViewController =
           FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//        flutterViewController.modalPresentationStyle = .fullScreen
        present(flutterViewController, animated: true, completion: nil)
        
     }

}

