// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

//Test portage GLSL ES POCOF1 -> ShaderToy

uniform float time;
//vec3 grey = vec3(0.5);
vec3 grey = vec3(0.1,0.7,0.78);
float g = 4.;

vec3 bg(vec2 st) {
	return vec3(texture(iChannel0, st).rgb);
}

vec3 bw(vec3 col){
	 return vec3(col.r+col.g+col.b) /3.;
}

vec3 degrade(vec3 col){
	vec3 nc;
	if(col.r<0.4)
	  nc=vec3(0.);
	 else if(col.r<.65)
	  nc= grey;
	 else
	 	nc=vec3(1.);

	return nc;
}

vec3 pixelate(vec2 uv){
		float dx= g/iResolution.x;
		float dy= g/iResolution.y;
		float x= dx*floor(uv.x/dx);
		float y= dy*floor(uv.y/dy);

		vec2 k = vec2(x,y);
		//vec2 p = cameraAddent + k * cameraOrientation;
		return bg(k);

}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv =fragCoord/iResolution.xy;
	vec3 col=pixelate(uv);
    col = degrade(bw(col));
#ifdef DEBUG
    if(uv.x>0.33 && uv.x<0.66) col = bg(uv);
    if(uv.x>0.66) col = bw(bg(uv));
#endif
    if(col==grey){
        uv -= 0.5;
        col.b = 1.0-length(uv.xy);
    }
	fragColor =vec4(col,texture(iChannel0, uv).a);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}