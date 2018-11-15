//
//  ExhaleAction.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/15/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class ExhaleAction: BaseAction {
        
    required init(phase: Phase, view: BreatheView) {
        self.phase = phase
        self.view = view
    }
    
    var phase: Phase
    var view: BreatheView
    
    func playAnimation() {
        UIView.animate(withDuration: TimeInterval(phase.duration)) {
            self.view.transform = CGAffineTransform.identity.scaledBy(x: 0.5, y: 0.5)
        }
    }
    
}

