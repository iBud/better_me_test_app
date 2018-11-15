//
//  PhaseQueue.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/14/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import Foundation

class PhaseQueue {
    
    init(phases: [Phase]) {
        self.phases = phases
        totalDuration = self.phases.reduce(into: 0, { (result, phase) in
            result += phase.duration
        })
    }
    
    private(set) var phases: [Phase]
    private(set) var totalDuration: Int

    func run(with actionFactory: PhaseActionFactory, completion: @escaping ()->()) {
        runPhases(from: 0, actionFactory: actionFactory, completion: completion)
    }
    
    private func runPhases(from index: Int, actionFactory: PhaseActionFactory, completion: @escaping ()->()) {
        let action = actionFactory.createAction(for: phases[index])
        action.perform {
            let nextIndex = index + 1
            if nextIndex < self.phases.count {
                self.runPhases(from: nextIndex, actionFactory: actionFactory, completion: completion)
            }
            else {
                completion()
            }
        }
    }
    
}
