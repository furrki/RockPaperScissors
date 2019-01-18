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
       // self.layer.borderWidth = 2
       // self.layer.borderColor = #colorLiteral(red: 0.9321536233, green: 0.9321536233, blue: 0.9321536233, alpha: 1)
        self.layer.cornerRadius = 4
        self.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
        
    }
    override func draw(_ rect: CGRect) {
        self.draw(rect)
    }
}
