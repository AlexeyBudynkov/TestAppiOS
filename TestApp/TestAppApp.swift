//
//  TestAppApp.swift
//  TestApp
//
//  Created by Алан Максвелл on 26.01.2021.
//


import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import SwiftUI

@main
struct TestAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        AppCenter.logLevel = .verbose
        AppCenter.start(withAppSecret: "f57108c0-c3c6-4648-8ffe-b784c4ffd347", services:[
          Analytics.self,
          Crashes.self
        ])

        return true
    }
}

