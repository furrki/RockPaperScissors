//
//  MoveImageView.swift
//  RockPaperScissors
//
//  Created by Admin on 18.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//
import Foundation
import UIKit

class MoveImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    override func prepareForInterfaceBuilder() {
        custom()
    }
    func custom(){ 
        self.layer.cornerRadius = 4
        
    }
    override func draw(_ rect: CGRect) {
        self.draw(rect)
    }
}
