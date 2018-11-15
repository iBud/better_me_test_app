//
//  BreatheViewController.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/13/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

class BreatheViewController: UIViewController {
    
    @IBOutlet weak var breatheView: BreatheView!
    
    @IBOutlet weak var remainingTextLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    var phaseQueue: PhaseQueue?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialUI()
        phaseQueue = PhaseQueue(phases: PhaseProvider.shared.getDefaultPhases())
    }
    
    func setupInitialUI() {
        startButton.isHidden = false
        remainingTextLabel.isHidden = true
        remainingTimeLabel.isHidden = true
        
        breatheView.setupInitialUI()
    }
        
    // MARK: - IBAction
    
    @IBAction func startBreathing(_ sender: UIButton) {
        if let queue = phaseQueue {
            
            remainingTextLabel.isHidden = false
            remainingTimeLabel.isHidden = false
            startButton.isHidden = true
            
            remainingTimeLabel.text = String.timeString(for: queue.totalDuration)
            
            let counter = CountDown(totalSeconds: queue.totalDuration)
            counter.start { (secondsRemaining) in
                self.remainingTimeLabel.text = String.timeString(for: secondsRemaining - 1)
            }
            
            queue.run(with: ActionFactory(view: breatheView)) { [weak self] in
                self?.setupInitialUI()
            }
        }
    }

}

