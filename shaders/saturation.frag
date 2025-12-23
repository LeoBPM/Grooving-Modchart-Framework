#pragma header

uniform float sat;

void main() {
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 col = flixel_texture2D(bitmap, uv);

    float gray = dot(col.rgb, vec3(0.299, 0.587, 0.114));

    // Clamp para evitar invertir colores
    float t = clamp(1.0 + sat, 0.0, 9999.0);

    col.rgb = mix(vec3(gray), col.rgb, t);

    gl_FragColor = col;
}