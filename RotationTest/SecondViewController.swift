//
//  SecondViewController.swift
//  RotationTest
//
//  Created by yxibng on 2020/4/4.
//  Copyright © 2020 yxibng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var someButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .purple
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(someButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(someButton)
    }

    
    @objc func someButtonTapped() {
        let vc = BaseNavigationController(rootViewController: PresentViewController())
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        someButton.frame = CGRect(x: 100, y: 50, width: 50, height: 50)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.toPortrait()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

}

