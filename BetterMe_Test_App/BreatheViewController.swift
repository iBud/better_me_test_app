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
        
        breatheView.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        breatheView.backgroundColor = UIColor.yellow
    }
        
    // MARK: - IBAction
    
    @IBAction func startBreathing(_ sender: UIButton) {
        if let queue = phaseQueue {
            
            remainingTextLabel.isHidden = false
            remainingTimeLabel.isHidden = false
            startButton.isHidden = true
            
            let aCounter = CountDown(totalSeconds: queue.totalDuration)
            aCounter.start { (secondsRemaining) in
                self.remainingTimeLabel.text = String.timeString(for: secondsRemaining)
            }
            
            queue.run(with: ActionFactory(view: breatheView)) { [weak self] in
                self?.setupInitialUI()
            }
        }
    }

}

