//
//  FunctionDescriptionView.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/06/21.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

@IBDesignable
class FunctionDescriptionView: UIView {
    @IBOutlet weak var functionImgView: UIImageView!
    @IBOutlet weak var functionDescriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initFromXIB()
    }
    
    func initFromXIB() {
        let view = Bundle(for: FunctionDescriptionView.self).loadNibNamed("FunctionDescriptionView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBInspectable var functionImage: UIImage? {
        get {
            return functionImgView.image
        }
        set {
            functionImgView.image = newValue
        }
    }
    
    @IBInspectable var funtionDescription: String? {
        get {
            return functionDescriptionLabel.text
        }
        set {
            functionDescriptionLabel.text = newValue
        }
    }
}
