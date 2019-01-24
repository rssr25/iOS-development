//
//  Plane.swift
//  understandingMetal
//
//  Created by Pentagram Research on 24/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

import MetalKit
class Plane : Node
{
    var vertexBuffer : MTLBuffer?
    var indexBuffer : MTLBuffer?
    
    //set up the vertices.
    var vertices : [Float] = [
        -1, 1, 0, //v0
        -1, -1, 0, //v1
        1, -1, 0, //v2
        1, 1, 0, //v3
    ]
    var indices : [UInt16] = [
        0, 1, 2,
        2, 3, 0
    ]
    
    struct Constants
    {
        var animateBy : Float = 0.0
    }
    
    var constants = Constants()
    var time: Float = 0
    
    init(device : MTLDevice) {
        super.init()
        buildBuffers(device: device)
    }
    
    private func buildBuffers(device : MTLDevice)
    {
        vertexBuffer = device.makeBuffer(bytes: vertices, length: vertices.count * MemoryLayout<Float>.size, options: [])
        
        indexBuffer = device.makeBuffer(bytes: indices, length: indices.count * MemoryLayout<UInt16>.size, options: [])
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
        
        guard let indexBuffer = indexBuffer else {return}
        
        time += deltaTime
        let animateBy = abs(sin(time)/2 + 0.5)
        constants.animateBy = animateBy
        
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.setVertexBytes(&constants, length: MemoryLayout<Constants>.stride, index: 1)
        commandEncoder.drawIndexedPrimitives(type: .triangle,
                                              indexCount: indices.count,
                                              indexType: .uint16,
                                              indexBuffer: indexBuffer,
                                              indexBufferOffset: 0)
        
        
    }
}
