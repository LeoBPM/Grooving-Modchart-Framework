#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

uniform float Xspeed;
uniform float Yspeed;
uniform float XRate;
uniform float YRate;
uniform float axisX;
uniform float axisY;

void mainImage()
{
    vec2 uv = fragCoord / iResolution.xy;

    // Centrar UV para que la onda no empuje la pantalla
    vec2 centered = uv - 0.5;

    float offsetX = sin((iTime * Xspeed) + (centered.y * XRate)) * axisX;
    float offsetY = sin((iTime * Yspeed) + (centered.x * YRate)) * axisY;

    centered.x += offsetX;
    centered.y += offsetY;

    // Volver al rango normal
    uv = centered + 0.5;

    // Borde suave para evitar basura
    uv = clamp(uv, 0.001, 0.999);

    fragColor = texture(iChannel0, uv);
    gl_FragColor.a = texture(iChannel0, uv).a;
}