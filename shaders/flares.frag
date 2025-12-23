#pragma header

uniform float strength;

void main(){
	vec2 uv = openfl_TextureCoordv.xy;
	vec4 col = flixel_texture2D(bitmap, uv);

	// simple flare pass
	float flare = abs(uv.x - 0.5) * abs(uv.y - 0.5);
	flare = 1.0 - flare * 4.0;
	flare = max(flare, 0.0);

	col.rgb += flare * (strength/10) * 0.3;

	gl_FragColor = col;
}
