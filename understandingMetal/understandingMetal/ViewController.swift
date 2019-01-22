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
    
    //define once only at the start of the application
    
    var device : MTLDevice!
    var commandQueue : MTLCommandQueue!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        metalView.device = MTLCreateSystemDefaultDevice()
        device = metalView.device
        metalView.clearColor = Colors.greenColor
        metalView.delegate = self
        commandQueue = device.makeCommandQueue()
        
    }


}

extension ViewController : MTKViewDelegate
{
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
            let descriptor = view.currentRenderPassDescriptor else {return}
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
    
}
