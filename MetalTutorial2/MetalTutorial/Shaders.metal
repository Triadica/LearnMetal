#include <metal_stdlib>

using namespace metal;

struct Vertex {
    float2 position;
    float3 color;
};

struct VertexOut {
    float4 position [[position]];
    float3 color;
    float2 p0;
};

vertex VertexOut vertexFunction(uint vid [[vertex_id]], constant Vertex* vertices [[buffer(0)]]) {
    VertexOut out;
    out.position = float4(vertices[vid].position, 0.0, 1.0);
    // out.color = vertices[vid].color;
    out.p0 = vertices[vid].position;
    
    
    return out;
}


fragment float4 fragmentFunction(VertexOut in [[stage_in]]) {
    float3 color = float3(0.0, 0.0, 0.0);
    if (length(in.p0) < 0.6) {
        color = float3(1.0, 1.0, 0.0);
    } else {
//        color = float3(1.0, 0.0, 0.0);
    }
    return float4(color, 1.0);
}
