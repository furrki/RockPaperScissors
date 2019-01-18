//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Admin on 18.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var opMoves: UIStackView!
    @IBOutlet weak var playerMoves: UIStackView!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var pimgs: [MoveImageView] = []
    var opimgs: [MoveImageView] = []
    var isProcessing:Bool = false
    var turnTimer: Timer?
    
    deinit {
        if let tt = turnTimer {
            tt.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        Game.shared.initialize()
        pimgs = playerMoves.subviews.filter({ $0 is MoveImageView }) as! [MoveImageView]
        opimgs = opMoves.subviews.filter({ $0 is MoveImageView }) as! [MoveImageView]
        
        for img in pimgs {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
            tap.delegate = self
            img.addGestureRecognizer(tap)
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        if !isProcessing {
            if let sv = sender.view {
                isProcessing = true
                let nonclickedImages = pimgs.filter({ $0.tag != sv.tag })
                for nci in nonclickedImages {
                    nci.fadeOut {}
                }
                
                Game.shared.move(Move.getByTag(sv.tag))
                
                let opMove = Game.shared.lastOpMove
                let nonselectedImages = opimgs.filter({ $0.tag != opMove.tag })
                for nsi in nonselectedImages {
                    nsi.fadeOut {}
                }
                turnTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
                    self.reset()
                }
            } else {
                print("View Not Found")
            }
        }
    }
    
    func refreshLabels() {
        scoreLabel.text = "\(Game.shared.score)"
        roundLabel.text = "\(Game.shared.round)"
    }
    
    @objc func reset(){
        refreshLabels()
        let _ = pimgs.map({ $0.fadeIn {
            self.isProcessing = false
            }
        })
        let _ = opimgs.map({ $0.fadeIn {
            self.isProcessing = false
            }
        })
    }

}

