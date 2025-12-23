#pragma header
uniform float xPos;
uniform float yPos;
uniform float zoom;
uniform float ang;

void main()
{
    vec2 uv = openfl_TextureCoordv - 0.5;
    if(mod(ang,360.0) != 0.0){
        float rotation = mod(-ang,360.0) * (3.14/180.0);//3.14 = PI
        float c = cos(rotation), s = sin(rotation);
        uv *= mat2(
            vec2(c,-s/(openfl_TextureSize.x/openfl_TextureSize.y)),
            vec2(s/(openfl_TextureSize.y/openfl_TextureSize.x),c)
        );
    }
    uv = mod(uv * zoom + 0.5 + vec2(xPos,yPos),2.0);
    uv = abs(uv - (vec2(
        float(int(uv.x)),
        float(int(uv.y))
    )*2.0));
    //gl_FragColor = vec4(normal_map);
    gl_FragColor = flixel_texture2D(bitmap,uv);
}
