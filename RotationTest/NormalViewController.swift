//
//  NormalViewController.swift
//  RotationTest
//
//  Created by Endless Summer on 2020/5/13.
//  Copyright © 2020 yxibng. All rights reserved.
//

import Foundation
import UIKit

class NormalViewController: UIViewController {
    
    private lazy var someButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .purple
        button.layer.masksToBounds = true
        button.setTitle("dismiss", for: .normal)
        button.addTarget(self, action: #selector(someButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let textfield = UITextField()
    
    //MARK: UIViewController 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.toPortrait()
//    }
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.toPortrait()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return [.portrait, .landscapeLeft]
        return [.portrait]
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        someButton.frame = CGRect(x: 100, y: 50, width: 50, height: 50)
        
        textfield.frame = .init(x: 0, y: 0, width: 200, height: 50)
        textfield.center = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
    }
    
    @objc func someButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

private extension NormalViewController {
    func setupUI() {
        textfield.placeholder = "textfield"
        
        view.addSubview(someButton)
        view.addSubview(textfield)
        view.backgroundColor = .white
    }

    func setupData() {
    
    }
}



