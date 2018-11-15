//
//  HoldAction.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/15/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class HoldAction: BaseAction {
    
    required init(phase: Phase, view: BreatheView) {
        self.phase = phase
        self.view = view
    }
    
    var phase: Phase
    var view: BreatheView
    
    func playAnimation() {
    }
    
}
