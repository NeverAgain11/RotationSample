//
//  BaseNavigationController.swift
//  RotationTest
//
//  Created by Endless Summer on 2020/5/13.
//  Copyright © 2020 yxibng. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        guard let top = self.topViewController(), !top.skIsBeingDismiss else {
            if let vc = viewControllers.first {
                return vc.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
        return top.supportedInterfaceOrientations
    }
    
    override var shouldAutorotate: Bool {
        guard let top = self.topViewController(), !top.skIsBeingDismiss else {
            if let vc = viewControllers.first {
                return vc.shouldAutorotate
            }
            return super.shouldAutorotate
        }
        return top.shouldAutorotate
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        guard let top = self.topViewController(), !top.skIsBeingDismiss else {
            if let vc = viewControllers.first {
                return vc.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
        return top.preferredInterfaceOrientationForPresentation
    }
}
