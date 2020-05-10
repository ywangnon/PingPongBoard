//
//  ManualViewController.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/05/04.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {
    var manualView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        self.setAddTargets()
        self.setGestures()
    }
    
    func setViewFoundations() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    func setAddSubViews() {
        self.view.addSubview(manualView)
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.manualView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.manualView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.manualView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            self.manualView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
