//
//  PresentViewController.swift
//  RotationTest
//
//  Created by Endless Summer on 2020/5/13.
//  Copyright © 2020 yxibng. All rights reserved.
//

import Foundation
import UIKit

class PresentViewController: UIViewController {
    
    private lazy var someButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .purple
        button.layer.masksToBounds = true
        button.setTitle("present", for: .normal)
        button.addTarget(self, action: #selector(someButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .purple
        button.layer.masksToBounds = true
        button.setTitle("dismiss", for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: UIViewController 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.toLandscape()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.toLandscape()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        someButton.frame = CGRect(x: 100, y: 50, width: 150, height: 50)
        
        dismissButton.frame = CGRect(x: 100, y: 150, width: 150, height: 50)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        guard let top = self.presentedViewController?.topViewController(), !top.skIsBeingDismiss else {
            return .landscapeLeft
        }
        return top.supportedInterfaceOrientations
    }
    
    override var shouldAutorotate: Bool {
        guard let top = self.presentedViewController, !top.skIsBeingDismiss else {
            return super.shouldAutorotate
        }
        return top.shouldAutorotate
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        guard let top = self.presentedViewController, !top.skIsBeingDismiss else {
            return .landscapeLeft
        }
        return top.preferredInterfaceOrientationForPresentation
    }
    
    @objc func someButtonTapped() {
        let vc = NormalViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true)
    }
}

private extension PresentViewController {
    func setupUI() {
        view.addSubview(someButton)
        view.addSubview(dismissButton)
        
        view.backgroundColor = .yellow
    }

    func setupData() {
    
    }
}


