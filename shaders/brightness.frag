#pragma header

uniform float brightness; // 0 = normal, 100 = blanco completo

void main() {
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 color = texture2D(bitmap, uv);
    
    // Calcular factor de brillo (0.0 a 1.0)
    float factor = brightness / 100.0;
    
    // Interpolar entre el color original y blanco
    vec3 white = vec3(1.0, 1.0, 1.0);
    color.rgb = mix(color.rgb, white, factor);
    
    gl_FragColor = color;
}