//
//  AppDelegate.swift
//  TestApp
//
//  Created by Алан Максвелл on 27.01.2021.
//  Copyright © 2021 Алан Максвелл. All rights reserved.
//
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        AppCenter.logLevel = .verbose
         AppCenter.start(withAppSecret: "f57108c0-c3c6-4648-8ffe-b784c4ffd347", services:[
           Analytics.self,
           Crashes.self
         ])
        
        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

