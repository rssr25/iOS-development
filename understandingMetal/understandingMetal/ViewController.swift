//
//  ViewController.swift
//  understandingMetal
//
//  Created by Pentagram Research on 22/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

import UIKit
import MetalKit

enum Colors
{
    static let greenColor = MTLClearColor(red: 0.0, green: 0.4, blue: 0.21, alpha: 1.0)
}

class ViewController: UIViewController {

    var metalView : MTKView
    {
        return view as! MTKView
    }
    
    var renderer : Renderer?
    
    //define once only at the start of the application
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        metalView.device = MTLCreateSystemDefaultDevice()
        guard let device = metalView.device else{
            fatalError("device not created. Run on physical device.")
        }
        metalView.clearColor = Colors.greenColor
        renderer = Renderer(device: device)
        metalView.delegate = renderer
        
    }


}


