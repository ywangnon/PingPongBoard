//
//  DataModel.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/03/01.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import Foundation
import RealmSwift

struct PingpongScore {
    var redSetScore: Int
    var blueSetScore: Int
    var redScore: Int
    var blueScore: Int
}

class Score: Object {
    @objc dynamic var id = 0
    @objc dynamic var redSetScore: Int = 0
    @objc dynamic var blueSetScore: Int = 0
    @objc dynamic var redScore: Int = 0
    @objc dynamic var blueScore: Int = 0
    @objc dynamic var date = Date()
    
    convenience init(redSetScore: Int,
                     blueSetScore: Int,
                     redScore: Int,
                     blueScore: Int) {
        self.init()
        self.id = self.incrementID()
        self.redSetScore = redSetScore
        self.blueSetScore = blueSetScore
        self.redScore = redScore
        self.blueScore = blueScore
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Score.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
