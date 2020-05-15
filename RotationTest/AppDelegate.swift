//
//  AppDelegate.swift
//  RotationTest
//
//  Created by yxibng on 2020/4/4.
//  Copyright © 2020 yxibng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return [.landscape, .portrait]
    }
}


extension AppDelegate {
    
    class func topViewController() -> UIViewController? {
        guard let window = UIApplication.shared.delegate?.window else {
            return nil
        }
        return window?.rootViewController?.topViewController()
    }
}



extension UIViewController {
    
    func topViewController() -> UIViewController? {
        return UIViewController.topViewController(withRootViewController: self)
    }
    
    var skIsBeingDismiss: Bool {
        if self.isBeingDismissed || self.tabBarController?.isBeingDismissed == true || self.navigationController?.isBeingDismissed == true {
            return true
        }
        return false
    }

    fileprivate class func topViewController(withRootViewController rootViewController: UIViewController?) -> UIViewController? {
        
        guard let root = rootViewController else {
            return nil
        }
        
        if let tabbarController = rootViewController as? UITabBarController {
            return self.topViewController(withRootViewController: tabbarController.selectedViewController)
        }
        
        if let nav = rootViewController as? UINavigationController {
            return self.topViewController(withRootViewController: nav.visibleViewController)
        }
        
//        if let presentedViewController = root.presentedViewController {
//            return self.topViewController(withRootViewController: presentedViewController)
//        }
        
        return root
    }
    
    func toLandscape() {
        UIDevice.current.setValue(UIDeviceOrientation.unknown.rawValue, forKey: "orientation")
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    func toPortrait() {
        UIDevice.current.setValue(UIDeviceOrientation.unknown.rawValue, forKey: "orientation")
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
}
