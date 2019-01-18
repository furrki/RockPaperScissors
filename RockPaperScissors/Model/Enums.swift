//
//  Enums.swift
//  RockPaperScissors
//
//  Created by Admin on 18.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
import UIKit
enum Move: CaseIterable {
    case rock
    case paper
    case scissors
}
extension Move {
    var img: UIImage {
        switch self {
        case .rock:
            return UIImage(named: "rock")!
            
        case .paper:
            return UIImage(named: "paper")!
            
        case .scissors:
            return UIImage(named: "scissors")!
        }
    }
    func scoreAgainst(move: Move) -> Int {
        switch self {
        case .rock:
            switch move {
            case .rock:
                return 0
                
            case .paper:
                return -1
                
            case .scissors:
                return 1
            }
            
        case .paper:
            switch move {
            case .rock:
                return 1
                
            case .paper:
                return 0
                
            case .scissors:
                return -1
            }
            
        case .scissors:
            switch move {
            case .rock:
                return -1
                
            case .paper:
                return 1
                
            case .scissors:
                return 0
            }
        }
    }
}

