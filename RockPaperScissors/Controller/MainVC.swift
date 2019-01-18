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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        let imgs = playerMoves.subviews.filter({ $0 is MoveImageView })
        for img in imgs {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
            tap.delegate = self // This is not required
            img.addGestureRecognizer(tap)
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        print(sender.view!.tag)
    }

}

