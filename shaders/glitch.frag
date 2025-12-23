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

/* Mess around with the parameters to actually understand its structure */
/*                 I hope it will come in handy!                        */
/*                                                                      */
/*                       - HealliesGames -                              */


// Random Function: https://www.shadertoy.com/view/Xt23Ry
// Used to obtain a random number.
float rand(float co) { return fract(sin(co*(91.3458)) * 47453.5453); }


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1).
    vec2 uv = fragCoord/iResolution.xy;
    
    float randOfs;         	// Determines the offset of each segment.
    float hOfsSkip = .05;  	// Step to determine how many segments there should be.
    float intensity = .02; 	// Shake intensity.
    

    for(float i = 0.0; i < 1.0; i += hOfsSkip) {  // For each segment:
        randOfs = rand(iTime + i) * intensity; 	  // Randomly calculate an offset.
  
        if(uv.y >= i && uv.y <= i + hOfsSkip)     // If UV coordinates are inside the segment:
        	uv.x += randOfs;					  // Apply the offset.
    }

    vec4 tex = texture(iChannel0, uv);			  // Return the texture with altered UV.
    fragColor = tex;							  // Show in output the texture.
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}