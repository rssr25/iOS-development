//
//  Shader.metal
//  understandingMetal
//
//  Created by Pentagram Research on 24/01/19.
//  Copyright © 2019 rahul sharma. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct Constants
{
    float animateBy;
};

struct VertexIn
{
    float4 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct VertexOut
{
    float4 position [[ position ]]; //rasteriser knows that this is the position value
    float4 color;
};

vertex VertexOut vertex_shader(const VertexIn vertexIn [[ stage_in ]])
{
    VertexOut vertexOut;
    vertexOut.position = vertexIn.position;
    vertexOut.color = vertexIn.color;

    return vertexOut;
    //return float4(vertices[vertexId], 1);
}

fragment half4 fragment_shader(VertexOut vertexIn [[ stage_in ]])
{
    float grayColor = (vertexIn.color.r + vertexIn.color.g + vertexIn.color.b) / 3;
    return half4(grayColor, grayColor, grayColor, 1);
}


