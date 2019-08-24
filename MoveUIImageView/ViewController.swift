//
//  ViewController.swift
//  MoveUIImageView
//
//  Created by JuneK on 24/08/2019.
//  Copyright © 2019 JuneK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var pigeonImageView: UIImageView!
    @IBOutlet private weak var appleImageView: UIImageView!
    @IBOutlet private weak var startButton: UIButton!

    // apple logo x = 701, y = 202
    // pigeon logo x = 134, y = 202
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func startMoveButton(_ sender: Any) {
        
        //        moveIt(pigeonImageView,10)
        springMove(pigeonImageView)
        appleMove()
    }
    
    
    private func connect() {
        // Disables the button to avoid user interaction when the animation is running
        startButton.isEnabled = false
        
        pigeonImageView.startAnimating()
        
        // Simulates a connection with a delay of 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.pigeonImageView.stopAnimating()
            
            // Enables the button to allow user interaction
            self.startButton.isEnabled = true
            // Updates UI
            
        }
    }
    
    
    func moveIt(_ imageView: UIImageView,_ speed:CGFloat) {
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {
            imageView.frame.origin.x = self.view.frame.size.width
        }, completion: { (_) in
            imageView.frame.origin.x = -imageView.frame.size.width
            self.moveIt(imageView,speeds)
        })
    }
    
    
    func springMove (_ imageView: UIImageView) {
        pigeonImageView.center.x = -30
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 30.0, initialSpringVelocity: 30.0, options: UIView.AnimationOptions.curveEaseOut, animations: ({
            
            self.pigeonImageView.center.x = self.view.frame.width / 2
            
            
        }), completion: nil)
        
    }
    
    func appleMove() {
        
        appleImageView.frame.origin.x = 701
        
        UIView.animate(withDuration: 0.90, delay: 0.0, usingSpringWithDamping: 30.0, initialSpringVelocity: 30.0, options: UIView.AnimationOptions.curveEaseOut, animations: ({
            
            self.appleImageView.center.x = self.view.frame.width + 50
//            self.origonPostion()
        }), completion: nil)
        
    }
    
    func origonPostion() {
        
        UIView.animate(withDuration: 1.90, delay: 0.0, usingSpringWithDamping: 30.0, initialSpringVelocity: 30.0, options: UIView.AnimationOptions.curveEaseOut, animations: ({
            
            //            self.appleImageView.center.x = self.view.frame.width + 50
            self.appleImageView.frame.origin.x = 701
            
        }), completion: nil)
    }
}

