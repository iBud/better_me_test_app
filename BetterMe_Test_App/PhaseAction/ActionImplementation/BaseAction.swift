//
//  BaseAction.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/14/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

protocol BaseAction: PhaseAction {
    
    init(phase: Phase, view: BreatheView)

    var phase: Phase { get }
    var view: BreatheView { get }

    func playAnimation()
}

extension BaseAction {
    
    func perform(with callback: @escaping ()->()) {
        view.backgroundColor = phase.color
        
        view.timerLabel.isHidden = false
        view.phaseNameLabel.isHidden = false
        view.timerLabel.text = String.timeString(for: phase.duration)
        
        let countDown = CountDown(totalSeconds: phase.duration)
        countDown.start { (secondsRemaining) in
            self.view.timerLabel.text = String.timeString(for: secondsRemaining)
            if secondsRemaining == 0 {
                self.view.timerLabel.isHidden = true
                self.view.phaseNameLabel.isHidden = true
                
                callback()
            }
        }
        
        view.phaseNameLabel.text = phase.phaseName.uppercased()
        
        playAnimation()
    }

}
