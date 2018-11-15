//
//  UIColor+Extensions.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/13/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let string = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let scanner = Scanner(string: string)
        
        if (string.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha:1)
    }
}
