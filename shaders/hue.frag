#pragma header

uniform float hue; // grados

// convierte grados a radianes
float rad(float d) {
    return d * 0.01745329251;
}

void main() {
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 col = flixel_texture2D(bitmap, uv);

    float angle = rad(hue);

    // Valores constantes para transformar RGB -> IQ color space
    float U = cos(angle);
    float W = sin(angle);

    mat3 hueMatrix = mat3(
        0.299 + 0.701 * U + 0.168 * W, 0.587 - 0.587 * U + 0.330 * W, 0.114 - 0.114 * U - 0.497 * W,
        0.299 - 0.299 * U - 0.328 * W, 0.587 + 0.413 * U + 0.035 * W, 0.114 - 0.114 * U + 0.292 * W,
        0.299 - 0.3   * U + 1.25  * W, 0.587 - 0.588 * U - 1.05  * W, 0.114 + 0.886 * U - 0.203 * W
    );

    col.rgb = col.rgb * hueMatrix;

    gl_FragColor = col;
}