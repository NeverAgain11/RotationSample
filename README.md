# iOS-Rotation-demo

参考： 

- [iOS屏幕旋转及其基本适配方法](https://www.jianshu.com/p/a354ca1890de)
- [How to allow only single UIViewController to rotate in both Landscape and Portrait direction?](https://stackoverflow.com/questions/17466048/how-to-allow-only-single-uiviewcontroller-to-rotate-in-both-landscape-and-portra)


```
extension UIViewController {
    
    func topViewController() -> UIViewController? {
        return UIViewController.topViewController(withRootViewController: self)
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
        
        if let presentedViewController = root.presentedViewController {
            return self.topViewController(withRootViewController: presentedViewController)
        }
        
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

```



