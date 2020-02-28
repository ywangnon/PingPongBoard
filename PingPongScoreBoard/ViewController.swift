//
//  ViewController.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/02/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let value = UIDeviceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func setPortrait() {
        let value = UIDeviceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
    
    
    @IBSegueAction func move(_ coder: NSCoder) -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldSupportLandScape = true
        return ScoreBoardViewController(coder: coder)
    }
}
