//
//  ViewController.swift
//  fffluter
//
//  Created by Jeevan Chaudhary on 9/11/25.
//

import UIKit
import Flutter
//import FlutterPluginRegistrant

class ViewController: UIViewController {
    
//    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        flutterEngine.run();
        // Connects plugins with iOS platform code to this app.
//        GeneratedPluginRegistrant.register(with: self.flutterEngine);
        
        let button = UIButton(type:UIButton.ButtonType.custom)
            button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
            button.setTitle("Show Flutter!", for: UIControl.State.normal)
            button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
            button.backgroundColor = UIColor.blue
            self.view.addSubview(button)
          }

    @objc func showFlutter() {
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let flutterVC = FlutterViewController(engine: appDelegate.flutterEngine, nibName: nil, bundle: nil)
                flutterVC.modalPresentationStyle = .fullScreen
                present(flutterVC, animated: true) {
                    // Send data *after* FlutterViewController is visible
    //                sendUserDataToFlutter(engine: appDelegate.flutterEngine)
                    let channel = FlutterMethodChannel(
                        name: "com.globalBank.module/nativeCommunication",
                        binaryMessenger: appDelegate.flutterEngine.binaryMessenger
                    )
                    
                    channel.setMethodCallHandler { call, result in
                        if call.method == "closeFlutter" {
                            self.dismiss(animated: true); result(nil)
                        } else { result(FlutterMethodNotImplemented) }
                    }
                }
            }
        }


}

