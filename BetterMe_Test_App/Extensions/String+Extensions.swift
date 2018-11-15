//
//  String+Extensions.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/15/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import Foundation

extension String {
    
    static func timeString(for seconds: Int) -> String {
        let hours = seconds / 3600
        let tempValue = seconds % 3600
        let minutes = tempValue / 60
        let seconds = tempValue % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}
