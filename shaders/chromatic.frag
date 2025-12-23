#pragma header

uniform float Xamount;

void main() {
	vec2 uv = openfl_TextureCoordv.xy;

	vec2 shift = vec2((Xamount/10) / openfl_TextureSize.x * 2.0, 0.0);

	float r = flixel_texture2D(bitmap, uv + shift).r;
	float g = flixel_texture2D(bitmap, uv).g;
	float b = flixel_texture2D(bitmap, uv - shift).b;
	float a = flixel_texture2D(bitmap, uv).a;

	gl_FragColor = vec4(r, g, b, a);
}