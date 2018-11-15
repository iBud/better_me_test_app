//
//  PhaseProvider.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/15/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import Foundation

class PhaseProvider {
    
    static let shared = PhaseProvider()
    
    func getDefaultPhases() -> [Phase] {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                return getPhases(with: data)
            }
            fatalError("Can't read default data file!!!")
        }
        fatalError("Can't found default data file!!!")
    }
    
    func getPhases(with data: Data) -> [Phase] {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode([Phase].self, from: data) {
            return result
        }
        fatalError("Wrong data format!!!")

    }
}
