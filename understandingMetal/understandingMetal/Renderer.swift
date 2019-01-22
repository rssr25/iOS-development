//
//  Renderer.swift
//  understandingMetal
//
//  Created by Pentagram Research on 22/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

import Foundation
import MetalKit

class Renderer : NSObject
{
    let device : MTLDevice
    let commandQueue : MTLCommandQueue
    
    init(device : MTLDevice)
    {
        self.device = device
        commandQueue = device.makeCommandQueue()!
        super.init()
    }
}

extension Renderer : MTKViewDelegate
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
