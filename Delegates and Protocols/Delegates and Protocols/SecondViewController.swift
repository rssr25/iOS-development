//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Pentagram Research on 30/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit


protocol CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {

    var delegat : CanReceive?
    
    var data = ""
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }
    
    @IBAction func sendDataBack(_ sender: UIButton)
    {
        delegat?.dataReceived(data: textField.text!)
        dismiss(animated: true, completion: nil)
        
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
