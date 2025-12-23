#pragma header

uniform float power;

vec3 ACESFilm(vec3 x){
	float a = 2.51;
	float b = 0.03;
	float c = 2.43;
	float d = 0.59;
	float e = 0.14;
	return clamp((x*(a*x+b))/(x*(c*x+d)+e), 0.0, 1.0);
}

void main() {
	vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
	vec3 col = color.rgb;
	
	// Usar power directamente sin clamp
	float mixAmount = -power/10;
	
	// Mezclar entre color original y ACES
	col = mix(col, ACESFilm(col), mixAmount);
	
	// Mantener el alpha original
	gl_FragColor = vec4(col, color.a);
}