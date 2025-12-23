#pragma header

uniform float strength;
uniform float radius;

void main()
{
    vec2 uv = openfl_TextureCoordv.xy;
    vec2 center = vec2(0.5, 0.5);
    
    vec2 delta = uv - center;
    float dist = length(delta);
    
    // Usar valores por defecto si los uniforms son 0
    float finalStrength = (strength != 0.0) ? strength : 0.5;
    float finalRadius = (radius != 0.0) ? radius : 0.8;
    
    float bulge = 0.0;
    
    if (dist < finalRadius) {
        float factor = 1.0 - (dist / finalRadius);
        bulge = finalStrength * factor * factor;
    }
    
    vec2 newUV = uv - delta * bulge;
    
    gl_FragColor = texture2D(bitmap, newUV);
}