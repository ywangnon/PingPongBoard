//
//  ViewController.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/02/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var scoreList: UITableView!
    var scoreDatas: Results<Score>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let value = UIDeviceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        self.setData()
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
    
    func setData() {
        do {
            let realm = try Realm()
            
            self.scoreDatas = realm.objects(Score.self)
            
            print("data 개수", self.scoreDatas?.count)
        } catch {
            print("Set Database Error")
        }
        self.scoreList.reloadData()
    }
    
    func addDataBase() -> Score {
        do {
            let realm = try Realm()
            
            let score = Score(redSetScore: 0, blueSetScore: 0, redScore: 0, blueScore: 0)
            
            try realm.write {
                realm.add(score, update: .modified)
            }
            return score
        } catch {
            print("add Database Error")
        }
        return Score(redSetScore: 0, blueSetScore: 0, redScore: 0, blueScore: 0)
    }
    
    @IBSegueAction func addSetList(_ coder: NSCoder) -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldSupportLandScape = true
        let score = self.addDataBase()
        return ScoreBoardViewController(score)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("테이블 개수", self.scoreDatas?.count ?? 0)
        return self.scoreDatas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath) as! SetListCell
        cell.redSetScore.text = "\(self.scoreDatas?[indexPath.row].redSetScore ?? 0)"
        cell.blueSetScore.text = "\(self.scoreDatas?[indexPath.row].blueSetScore ?? 0)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let score = self.scoreDatas?[indexPath.row]
        let boardVC = ScoreBoardViewController(score)
        self.navigationController?.pushViewController(boardVC, animated: true)
    }
}
