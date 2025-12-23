#pragma header

uniform float strength; // 0.0 a 1.0
uniform float iTime;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main(){
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 col = flixel_texture2D(bitmap, uv);
    
    // Grano animado - multiplicamos el tiempo por un valor grande
    float grain = rand(uv + iTime * 10.0);
    grain = (grain - 0.5) * strength/15;
    
    // Aplicar el grano
    gl_FragColor = vec4(col.rgb + grain, col.a);
}