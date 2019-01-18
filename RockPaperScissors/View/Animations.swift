//
//  Animations.swift
//  RockPaperScissors
//
//  Created by Admin on 18.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeOut(completion: @escaping ()->()){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.2
        }, completion: { (finished: Bool) in
            completion()
        })
    }
    func fadeIn(completion: @escaping ()->()){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
        }, completion: { (finished: Bool) in
            completion()
        })
    }
}
