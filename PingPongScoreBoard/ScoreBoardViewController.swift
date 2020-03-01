//
//  ScoreBoardViewController.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/02/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit
import RealmSwift

class ScoreBoardViewController: UIViewController {

    @IBOutlet weak var redScoreLabel: UILabel!
    @IBOutlet weak var blueScoreLabel: UILabel!
    @IBOutlet weak var redSetScoreLabel: UILabel!
    @IBOutlet weak var blueSetScoreLabel: UILabel!
    
    private var redScorePoint: Int?
    private var blueScorePoint: Int?
    private var redSetScorePoint: Int?
    private var blueSetScorePoint: Int?
    
    private var score: Score?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.setFontSize(self.redScoreLabel)
//        self.setFontSize(self.blueScoreLabel)
//        self.setFontSize(self.redSetScoreLabel)
//        self.setFontSize(self.blueSetScoreLabel)
//        
//        self.resetScore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLandscape()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldSupportLandScape = false
    }
    
    init(_ score: Score?) {
        self.score = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeLeft]
    }
    
    func setLandscape() {
        let value = UIDeviceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground(_:)), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func resetScore() {
        self.redScorePoint = 01
        self.blueScorePoint = 0
        self.redSetScorePoint = 0
        self.blueSetScorePoint = 0
        
        print("redScore", redScorePoint)
        
        self.redScoreLabel.text = "\(self.redScorePoint!)"
        self.blueScoreLabel.text = "\(self.blueScorePoint!)"
        self.redSetScoreLabel.text = "\(self.redSetScorePoint!)"
        self.blueSetScoreLabel.text = "\(self.blueSetScorePoint!)"
    }
    
    func setFontSize(_ label: UILabel) {
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.numberOfLines = 0
        label.font = label.font.withSize(label.frame.height * 2/3)
    }
    
    @IBAction func redScoreTapGesture(_ sender: Any) {
        self.redScorePoint! += 1
        self.redScoreLabel.text = "\(self.redScorePoint!)"
    }
    @IBAction func blueScoreTapGesture(_ sender: Any) {
        self.blueScorePoint! += 1
        self.blueScoreLabel.text = "\(self.blueScorePoint!)"
    }
    @IBAction func redSetScoreTapGesture(_ sender: Any) {
        self.redSetScorePoint! += 1
        self.redSetScoreLabel.text = "\(self.redSetScorePoint!)"
    }
    @IBAction func blueSetScoreTapGesture(_ sender: Any) {
        self.blueSetScorePoint! += 1
        self.blueSetScoreLabel.text = "\(self.blueSetScorePoint!)"
    }
    
    func updateDataBase(_ redSetScore: Int, _ blueSetScore: Int, _ redScore: Int, _ blueScore: Int) {
        do {
            let realm = try Realm()
            
            
            
            try realm.write {
                
            }
        } catch {
            print("update Error")
            
        }
    }
}

extension ScoreBoardViewController {
    @objc func willEnterForeground(_ noti: Notification) {
        self.setLandscape()
    }
}
