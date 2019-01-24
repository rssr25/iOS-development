//
//  Renderable.swift
//  understandingMetal
//
//  Created by Pentagram Research on 24/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

import MetalKit

protocol Renderable {
    var pipelineState : MTLRenderPipelineState! { get set }
    var vertexFunctionName : String { get }
    var fragmentFunctionName : String { get }
    var vertexDescriptor : MTLVertexDescriptor { get }
}

extension Renderable
{
    func buildPipelineState(device : MTLDevice) -> MTLRenderPipelineState
    {
        let library = device.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: vertexFunctionName)
        let fragmentFunction = library?.makeFunction(name: fragmentFunctionName)
        
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        pipelineDescriptor.vertexDescriptor = vertexDescriptor
        
        let pipelineState : MTLRenderPipelineState
        
        do
        {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        }catch let error as NSError
        {
            fatalError("error: \(error.localizedDescription)")
        }
        
        return pipelineState
    }
}
