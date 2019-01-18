//
//  Enums.swift
//  RockPaperScissors
//
//  Created by Admin on 18.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
import UIKit
enum Moves: CaseIterable {
    case rock
    case paper
    case scissors
}
extension Moves {
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
}
