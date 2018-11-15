//
//  InhaleAction.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/14/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class InhaleAction: BaseAction {
    
    required init(phase: Phase, view: BreatheView) {
        self.phase = phase
        self.view = view
    }
    
    var phase: Phase
    var view: BreatheView
    
    func playAnimation() {
        UIView.animate(withDuration: TimeInterval(phase.duration)) {
            self.view.animatedView.transform = CGAffineTransform.identity
        }
    }
    
}
