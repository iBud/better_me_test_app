//
//  BreatheView.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/14/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class BreatheView: UIView {
    
    @IBOutlet weak var animatedView: UIView!
    
    @IBOutlet weak var phaseNameLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupInitialUI()
    }
    
    func setupInitialUI() {
        animatedView.layer.borderColor = UIColor.black.cgColor
        animatedView.layer.borderWidth = 1.0
        
        animatedView.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        animatedView.backgroundColor = UIColor.yellow
        
        timerLabel.isHidden = true
        phaseNameLabel.isHidden = true
    }
    
}
