#pragma header

uniform float strength;

void main(){
	vec4 col = flixel_texture2D(bitmap, openfl_TextureCoordv.xy);
	vec3 color = col.rgb;

	color = (color - 0.5) * (1.0 + strength/10) + 0.5;

	gl_FragColor = vec4(color, col.a);
}