//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Pentagram Research on 22/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var ballIndex : Int = 0;
    
    @IBOutlet weak var magic8BallImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        randomChange8BallAnswer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func askButtonPress(_ sender: UIButton)
    {
        randomChange8BallAnswer()
    }
    
    func randomChange8BallAnswer()
    {
        ballIndex = Int.random(in: 0 ... 4)
        
        magic8BallImageView.image = UIImage(named: ballArray[ballIndex])
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        randomChange8BallAnswer()
    }
    

}

