//
//  SetListCell.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/03/01.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class SetListCell: UITableViewCell {
    
    @IBOutlet var redSetScore: UILabel!
    @IBOutlet var blueSetScore: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
