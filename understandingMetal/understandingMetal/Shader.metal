//
//  Shader.metal
//  understandingMetal
//
//  Created by Pentagram Research on 24/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 vertex_shader(const device packed_float3 *vertices [[buffer(0)]], uint vertexId [[vertex_id]])
{
    return float4(vertices[vertexId], 1);
}

fragment half4 fragment_shader()
{
    return half4(1, 1, 1, 1);
}


