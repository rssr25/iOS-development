//
//  ViewController.swift
//  Segues
//
//  Created by Pentagram Research on 28/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textForSecondScreen: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "gotToSecondViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotToSecondViewController"
        {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.textPassedOver = textForSecondScreen.text
            
        }
    }

}

