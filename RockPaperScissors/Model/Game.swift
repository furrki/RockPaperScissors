//
//  Game.swift
//  RockPaperScissors
//
//  Created by Admin on 18.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

class Game {
    static var shared = Game()
    
    var score = 0
    var round = 0
    
    func generateOpMove(){
        let myMove = [Move.rock, Move.paper, Move.scissors].randomElement()
    }
    
    func move(_ m: Move){
        
        
    }
}
