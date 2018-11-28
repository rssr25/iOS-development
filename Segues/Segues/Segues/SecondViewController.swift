//
//  SecondViewController.swift
//  Segues
//
//  Created by Pentagram Research on 28/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var textPassedOver : String?
    @IBOutlet weak var firstScreenTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstScreenTextLabel.text = textPassedOver
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
