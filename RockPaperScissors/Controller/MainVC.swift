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
    @IBOutlet weak var sttLabel: UILabel!
    
    var pimgs: [MoveImageView] = []
    var opimgs: [MoveImageView] = []
    var isProcessing:Bool = false
    var turnTimer: Timer?
    let am = AudioManager()
    
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
        am.installTap { (r) in
            self.sttCheck(r: r)
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        
        if let sv = sender.view {
            select(move: Move.getBy(tag: sv.tag))
        } else {
            print("View Not Found")
        }
        
    }
    func select(move: Move){
        if !isProcessing {
            isProcessing = true
            am.removeTap()
            
            let sv = pimgs.filter({ $0.tag == move.tag }).first!
            let nonclickedImages = pimgs.filter({ $0.tag != sv.tag })
            for nci in nonclickedImages {
                nci.fadeOut {}
            }
            
            let dscore = Game.shared.move(Move.getBy(tag: sv.tag))
            
            let opMove = Game.shared.lastOpMove
            let nonselectedImages = opimgs.filter({ $0.tag != opMove.tag })
            for nsi in nonselectedImages {
                nsi.fadeOut {}
            }
            let opSelected = opimgs.filter({ $0.tag == opMove.tag }).first!
            
            if dscore == 1 {
                sv.shake {
                    self.reset()
                }
            } else if dscore == -1 {
                opSelected.shake {
                    self.reset()
                }
            } else {
                sv.shake{
                    self.reset()
                }
                opSelected.shake {
                    self.reset()
                }
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
        am.installTap { (r) in
            self.sttCheck(r: r)
        }
    }
    func sttCheck(r: String){
        sttLabel.text = r
        switch r  {
        case Move.rock.str:
            self.select(move: .rock)
            break
        case Move.paper.str:
            self.select(move: .paper)
            break
        case Move.scissors.str:
            self.select(move: .scissors)
            break
        default: break
            
        }
    }
}

