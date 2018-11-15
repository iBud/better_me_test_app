//
//  CountDown.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/14/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class CountDown {
    
    init(totalSeconds: Int, step: Int = 1) {
        self.totalSeconds = totalSeconds
        self.step = step
    }
    
    let totalSeconds: Int
    let step: Int
    
    private var secondsLeft: Int = 0
    private weak var timer: Timer?
    
    func start(with callBack: @escaping (Int)->()) {
        secondsLeft = totalSeconds
        sceduleTimer(with: callBack)
    }
    
    func sceduleTimer(with callBack: @escaping (Int)->()) {
        let interval = min(secondsLeft, step)
        
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false, block: { (_) in
            self.secondsLeft -= interval
            if self.secondsLeft > 0 {
                self.sceduleTimer(with: callBack)
            }
            callBack(self.secondsLeft)
        })
    }
}
