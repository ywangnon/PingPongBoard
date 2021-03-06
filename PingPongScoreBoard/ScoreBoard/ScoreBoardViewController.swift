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
    
    private var score: Score?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLandscape()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldSupportLandScape = false
    }
    
    /// 디바이스에 내가 원하는 방향을 알린다. 가로 방향
    func setLandscape() {
        let value = UIDeviceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func setScore(_ score: Score?) {
        self.score = score
    }
    
    func setLabel() {
        self.setFontSize(self.redScoreLabel)
        self.setFontSize(self.blueScoreLabel)
        self.setFontSize(self.redSetScoreLabel)
        self.setFontSize(self.blueSetScoreLabel)
        
        self.setLabelText()
    }
    
    func setFontSize(_ label: UILabel) {
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.numberOfLines = 0
        label.font = label.font.withSize(label.frame.height * 2/3)
    }
    
    func setLabelText() {
        self.redScoreLabel.text = "\(self.score?.redScore ?? 0)"
        self.blueScoreLabel.text = "\(self.score?.blueScore ?? 0)"
        self.redSetScoreLabel.text = "\(self.score?.redSetScore ?? 0)"
        self.blueSetScoreLabel.text = "\(self.score?.blueSetScore ?? 0)"
    }
    
}

extension ScoreBoardViewController {
    @IBAction func infomationButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Manual", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "manual")
        view.modalPresentationStyle = .overFullScreen
        present(view, animated: true, completion: nil)
    }
    
    /// 모든 점수 0으로 초기화
    @IBAction func resetButton(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.redScore = 0
                self.score?.blueScore = 0
                self.score?.redSetScore = 0
                self.score?.blueSetScore = 0
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        self.setLabel()
    }
    /// 빨간팀 점수 +1
    @IBAction func redScoreTapGesture(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.redScore += 1
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.redScoreLabel.text = "\(String(describing: self.score?.redScore ?? 0))"
    }
    /// 파란팀 점수 +1
    @IBAction func blueScoreTapGesture(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.blueScore += 1
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.blueScoreLabel.text = "\(self.score?.blueScore ?? 0)"
    }
    /// 빨간팀 세트 점수 +1
    @IBAction func redSetScoreTapGesture(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.redSetScore += 1
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.redSetScoreLabel.text = "\(self.score?.redSetScore ?? 0)"
    }
    /// 파란팀 세트 점수 +1
    @IBAction func blueSetScoreTapGesture(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.blueSetScore += 1
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.blueSetScoreLabel.text = "\(self.score?.blueSetScore ?? 0)"
    }
    /// 빨간팀 점수 -1
    @IBAction func redScoreSwipeGesture(_ sender: Any) {
        print("red score down")
        do {
            let realm = try Realm()
            
            try realm.write {
                if (self.score?.redScore ?? 0) > 0 {
                    self.score?.redScore -= 1
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.redScoreLabel.text = "\(String(describing: self.score?.redScore ?? 0))"
    }
    /// 파란팀 점수 -1
    @IBAction func blueScoreSwipeGesture(_ sender: Any) {
        print("blue score down")
        do {
            let realm = try Realm()
            
            try realm.write {
                if (self.score?.blueScore ?? 0) > 0 {
                    self.score?.blueScore -= 1
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.blueScoreLabel.text = "\(self.score?.blueScore ?? 0)"
    }
    /// 빨간팀 세트 점수 -1
    @IBAction func redSetScoreSwipeGesture(_ sender: Any) {
        print("red Set score down")
        do {
            let realm = try Realm()
            
            try realm.write {
                if (self.score?.redSetScore ?? 0) > 0 {
                    self.score?.redSetScore -= 1
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.redSetScoreLabel.text = "\(self.score?.redSetScore ?? 0)"
    }
    /// 파란팀 세트 점수 -1
    @IBAction func blueSetScoreSwipeGesture(_ sender: Any) {
        print("blue Set score down")
        do {
            let realm = try Realm()
            
            try realm.write {
                if (self.score?.blueSetScore ?? 0) > 0 {
                    self.score?.blueSetScore -= 1
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.blueSetScoreLabel.text = "\(self.score?.blueSetScore ?? 0)"
    }
    // 빨강 점수 초기화
    @IBAction func redScoreLongPressed(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.redScore = 0
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.redScoreLabel.text = "\(self.score?.redScore ?? 0)"
        
    }
    // 파랑 점수 초기화
    @IBAction func blueScoreLongPressed(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.blueScore = 0
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.blueScoreLabel.text = "\(self.score?.blueScore ?? 0)"
    }
    // 빨강 세트 점수 초기화
    @IBAction func redSetScoreLongPressed(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.redSetScore = 0
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.redSetScoreLabel.text = "\(self.score?.redSetScore ?? 0)"
    }
    // 파랑 세트 점수 초기화
    @IBAction func blueSetScoreLongPressed(_ sender: Any) {
        do {
            let realm = try Realm()
            
            try realm.write {
                self.score?.blueSetScore = 0
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        self.blueSetScoreLabel.text = "\(self.score?.blueSetScore ?? 0)"
    }
}
