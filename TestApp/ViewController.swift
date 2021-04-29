//
//  ViewController.swift
//  TestApp
//
//  Created by Алан Максвелл on 27.01.2021.
//  Copyright © 2021 Алан Максвелл. All rights reserved.
//

import UIKit
import AppTrackingTransparency
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var textFiels: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        if let url = URL(string: "https://www.hackingwithswift.com") {
//            UIApplication.shared.open(url)
//        }
        
//        if let url = URL(string: "tg://msg?text=Mi_mensaje&to=+1555999") {
//            UIApplication.shared.open(url)
//        }

        textFiels.isSecureTextEntry = true
        textFiels.text = "hao!!!"
        
        
    }


}
//
//import UIKit
//import WebKit
//
//class ViewController: UIViewController, WKNavigationDelegate {
//
//    let webView = WKWebView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        webView.frame = view.bounds
//        webView.navigationDelegate = self
//
//        let url = URL(string: "https://www.google.com")!
//        let urlRequest = URLRequest(url: url)
//
//        webView.load(urlRequest)
//        webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        view.addSubview(webView)
//    }
//
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        if navigationAction.navigationType == .linkActivated  {
////            if let url = navigationAction.request.url,
////                let host = url.host, !host.hasPrefix("https://www.hackingwithswift.com"),
////                UIApplication.shared.canOpenURL(url) {
////                UIApplication.shared.open(url)
////                print(url)
////                print("Redirected to browser. No need to open it locally")
////                decisionHandler(.cancel)
////            } else {
////                print("Open it locally")
////                decisionHandler(.allow)
////            }
//        } else {
//            print("not a user click")
//            decisionHandler(.allow)
//        }
//    }
//}

