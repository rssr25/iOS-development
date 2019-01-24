//
//  Scene.swift
//  understandingMetal
//
//  Created by Pentagram Research on 24/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

import MetalKit

class Scene : Node
{
    var device : MTLDevice
    var size : CGSize
    
    init(device : MTLDevice, size : CGSize)
    {
        self.device = device
        self.size = size
        super.init()
    }
}
