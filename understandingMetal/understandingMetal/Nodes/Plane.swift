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
    
    var pipelineState: MTLRenderPipelineState!
    var fragmentFunctionName : String = "fragment_shader"
    var vertexFunctionName : String = "vertex_shader"
    var vertexDescriptor: MTLVertexDescriptor
    {
        let vertexDescriptor = MTLVertexDescriptor()
        //position data
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].offset = 0
        vertexDescriptor.attributes[0].bufferIndex = 0
        //color data
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].offset = MemoryLayout<float3>.stride
        vertexDescriptor.attributes[1].bufferIndex = 0
        
        vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        return vertexDescriptor
    }
    
    var vertices : [Vertex] =
        [
            Vertex(position: float3(-1, 1, 0),
                   color: float4(1, 0, 0, 1)),
            
            Vertex(position: float3(-1, -1, 0),
                   color: float4(0, 1, 0, 1)),
            
            Vertex(position: float3(1, -1, 0),
                   color: float4(0, 0, 1, 1)),
            
            Vertex(position: float3(1, 1, 0),
                   color: float4(1, 0, 1, 1))
            
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
        pipelineState = buildPipelineState(device: device)
    }
    
    private func buildBuffers(device : MTLDevice)
    {
        vertexBuffer = device.makeBuffer(bytes: vertices,
                                         length: vertices.count * MemoryLayout<Vertex>.stride,
                                         options: [])
        
        indexBuffer = device.makeBuffer(bytes: indices,
                                        length: indices.count * MemoryLayout<UInt16>.size,
                                        options: [])
    }
    
    override func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        super.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
        
        guard let indexBuffer = indexBuffer else {return}
        
        time += deltaTime
        let animateBy = abs(sin(time)/2 + 0.5)
        constants.animateBy = animateBy
        
        commandEncoder.setRenderPipelineState(pipelineState)
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.setVertexBytes(&constants, length: MemoryLayout<Constants>.stride, index: 1)
        commandEncoder.drawIndexedPrimitives(type: .triangle,
                                              indexCount: indices.count,
                                              indexType: .uint16,
                                              indexBuffer: indexBuffer,
                                              indexBufferOffset: 0)
        
        
    }
}

extension Plane : Renderable
{

}
