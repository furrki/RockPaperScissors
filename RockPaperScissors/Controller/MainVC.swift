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
    
    var pimgs: [MoveImageView] = []
    var opimgs: [MoveImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        pimgs = playerMoves.subviews.filter({ $0 is MoveImageView }) as! [MoveImageView]
        opimgs = opMoves.subviews.filter({ $0 is MoveImageView }) as! [MoveImageView]
        
        for img in pimgs {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
            tap.delegate = self
            img.addGestureRecognizer(tap)
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        if let sv = sender.view {
            let nonclickedImages = pimgs.filter({ $0.tag != sv.tag })
            for nci in nonclickedImages {
                nci.fadeOut {
                    
                }
            }
        } else {
            print("View Not Found")
        }
    }

}

