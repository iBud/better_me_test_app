//
//  Phase.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/13/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import UIKit

enum PhaseType: String {
    case inhale = "inhale"
    case exhale = "exhale"
    case hold = "hold"
}

class Phase: Decodable {
    
    let color: UIColor
    let type: PhaseType
    let duration: Int
    
    var phaseName: String {
        return type.rawValue
    }
    
    // MARK: - Decodable
    
    private enum CodingKeys: String, CodingKey {
        case color
        case type
        case duration
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let colorString = try container.decode(String.self, forKey: .color)
        color = UIColor(hex: colorString)
        if let phaseType = PhaseType(rawValue: try container.decode(String.self, forKey: .type)) {
            type = phaseType
        }
        else {
            fatalError("Wrong phase type!!!")
        }
        
        duration = try container.decode(Int.self, forKey: .duration)
    }
    
}
