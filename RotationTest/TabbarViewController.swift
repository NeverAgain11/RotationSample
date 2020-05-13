//
//  TabbarViewController.swift
//  RotationTest
//
//  Created by yxibng on 2020/4/4.
//  Copyright © 2020 yxibng. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        guard let top = self.topViewController(), !top.skIsBeingDismiss else {
            if let selectedViewController = self.selectedViewController {
                return selectedViewController.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
        return top.supportedInterfaceOrientations
    }
    
    override var shouldAutorotate: Bool {
        guard let top = self.topViewController(), !top.skIsBeingDismiss else {
            if let selectedViewController = self.selectedViewController {
                return selectedViewController.shouldAutorotate
            }
            return super.shouldAutorotate
        }
        return top.shouldAutorotate
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        guard let top = self.topViewController(), !top.skIsBeingDismiss else {
            if let selectedViewController = self.selectedViewController {
                return selectedViewController.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
        
        return top.preferredInterfaceOrientationForPresentation
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
