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
        self.setPortrait()
        self.setData()
    }
    
    /// 디바이스 방향 세로로 고정
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
    
    /// 데이터 세팅
    func setData() {
        do {
            let realm = try Realm()
            
            self.scoreDatas = realm.objects(Score.self).sorted(byKeyPath: "date", ascending: false)
            
        } catch {
            print("Set Database Error")
        }
        self.scoreList.reloadData()
    }
    
    /// 새로운 점수판에 사용할 점수 DB 생성
    /// - Returns: 점수
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
    
    /// 점수판 추가
    /// - Parameter sender: 버튼
    @IBAction func addSetList(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldSupportLandScape = true
        let board = UIStoryboard(name: "ScoreBoard", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "boardVC") as! ScoreBoardViewController
        let score = self.addDataBase()
        vc.setScore(score)
        self.navigationController?.pushViewController(vc, animated: true)
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldSupportLandScape = true
        let score = self.scoreDatas?[indexPath.row]
        let board = UIStoryboard(name: "ScoreBoard", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "boardVC") as! ScoreBoardViewController
        vc.setScore(score)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "삭제") { (UIContextualAction, UIView, _: (Bool) -> Void) in
            do {
                let realm = try Realm()
                
                let data = self.scoreDatas![indexPath.row]
                
                try realm.write {
                    realm.delete(data)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            self.scoreList.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
