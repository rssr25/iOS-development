//
//  Node.swift
//  understandingMetal
//
//  Created by Pentagram Research on 24/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

import MetalKit
class Node
{
    var name = "Untitled"
    var children : [Node] = []
    
    func add(childNode : Node)
    {
        children.append(childNode)
    }
    
    func render(commandEncoder: MTLRenderCommandEncoder, deltaTime : Float){
        
        for child in children
        {
            child.render(commandEncoder: commandEncoder, deltaTime: deltaTime)
        }
    }
}
