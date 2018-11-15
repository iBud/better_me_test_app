//
//  ActionFactory.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/15/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class ActionFactory: PhaseActionFactory {
    
    init(view: BreatheView) {
        self.view = view
    }
    
    let view: BreatheView
    
    func actionType(for phase: Phase) -> BaseAction.Type {
        switch phase.type {
        case .inhale:
            return InhaleAction.self
        case .exhale:
            return ExhaleAction.self
        case .hold:
            return HoldAction.self
        }
    }
    
    // MARK: - PhaseActionFactory
    
    func createAction(for phase: Phase) -> PhaseAction {
        return actionType(for: phase).init(phase: phase, view: view)
    }
    
}
