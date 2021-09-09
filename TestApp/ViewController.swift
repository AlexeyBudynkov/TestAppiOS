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
    
    lazy var locationManager = CLLocationManager()

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
        
        
        locationManager.delegate = self
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func checkLocationAccuracyAllowed() {
        switch locationManager.accuracyAuthorization {
        case .reducedAccuracy:
            print("approximate location")
        case .fullAccuracy:
            print("accurate location")
        @unknown default:
            print("unknown type")
        }
        
        locationManager.startUpdatingLocation()
    }
    
    func requestLocationAuth() {

        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            print("authorized always")
            checkLocationAccuracyAllowed()
        case .authorizedWhenInUse:
            print("authorized when in use")
            checkLocationAccuracyAllowed()
        case .notDetermined:
            print("not determined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        default:
            print("other")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location = locations.last else { return }
         print(location.coordinate.latitude)
         print(location.coordinate.longitude)
    }
     
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

//         let status = manager.authorizationStatus
//         let accuracyStatus = manager.accuracyAuthorization
//
//         if(status == .authorizedWhenInUse || status == .authorizedAlways){
//
//             if accuracyStatus == CLAccuracyAuthorization.reducedAccuracy{
//                 locationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "wantAccurateLocation", completion: { [self]
//                     error in
//
//                     if locationManager.accuracyAuthorization == .fullAccuracy{
//                         print("Full Accuracy Location Access Granted Temporarily")
//                     }
//                     else{
//                         print("Approx Location As User Denied Accurate Location Access")
//                     }
//                     locationManager.startUpdatingLocation()
//                 })
//             }
//         }
//         else{
             requestLocationAuth()
//         }
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

