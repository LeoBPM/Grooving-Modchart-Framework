#pragma header

uniform float targetX;
uniform float targetY;

void main() {
    vec2 uv = openfl_TextureCoordv.xy;

    float tilesX = max(1.0, abs(targetX) + 1.0);
    float tilesY = max(1.0, abs(targetY) + 1.0);

    if (targetX < 0.0) uv.x = -1.0 + uv.x;
    if (targetY < 0.0) uv.y = -1.0 + uv.y;

    vec2 tiled = fract(uv * vec2(tilesX, tilesY));

    gl_FragColor = flixel_texture2D(bitmap, tiled);
}
