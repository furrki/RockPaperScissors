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
    
    func shake(completion: @escaping ()->()) {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: { (finished: Bool) in
            completion()
        })
    }
}
