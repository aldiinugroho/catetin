//
//  AppDelegate.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import UIKit
import AsyncDisplayKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = ASDKNavigationController(rootViewController: MainViewController())
        return true
    }
}
