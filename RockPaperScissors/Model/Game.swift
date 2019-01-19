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
    var lastOpMove: Move = .rock
    
    func generateOpMove() -> Move {
       return [Move.rock, Move.paper, Move.scissors].randomElement()!
    }
    
    func move(_ m: Move) -> Int{
        let opMove = generateOpMove()
        lastOpMove = opMove
        score += m.scoreAgainst(move: opMove)
        round += 1
        return m.scoreAgainst(move: opMove)
    }
    
    func initialize(){
        round = 0
        score = 0
    }
}
