//
//  PhaseAction.swift
//  BetterMe_Test_App
//
//  Created by Yevgen on 11/14/18.
//  Copyright © 2018 iBud. All rights reserved.
//

import Foundation

protocol PhaseAction {
    
    func perform(with callback: @escaping ()->())
    
}
