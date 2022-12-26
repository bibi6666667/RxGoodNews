//
//  AppDelegate.swift
//  GoodNews
//
//  Created by Bibi on 2022/12/26.
//

import UIKit

@UIApplicationMain
//@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13.0, *) {
                    let navBarAppearance = UINavigationBarAppearance()
                    navBarAppearance.configureWithOpaqueBackground()
                    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                    navBarAppearance.backgroundColor = UIColor(displayP3Red: 47 / 255, green: 54 / 255, blue: 64 / 255, alpha: 1.0)
                    UINavigationBar.appearance().standardAppearance = navBarAppearance
                    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
                } else {
                    UINavigationBar.appearance().barTintColor = UIColor(displayP3Red:47 / 255, green: 54 / 255, blue: 64 / 255, alpha: 1.0)
                    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                }
        
        return true
    }
    
}

