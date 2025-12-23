// Made by TheLeerName

#pragma header

uniform float curveX;
uniform float curveY;

float wiggle(float u) {
	return 27.0*(1.0 - 2.0*u); 
}

void main() {
	mat3 matrix = mat3(
        1., 0., wiggle( 0.5 + curveX / 10. ),
        0., 1., wiggle( 0.5 + curveY / 10. ),
        0., 0., 1.
    );

    vec3 uv3 = matrix * vec3(openfl_TextureCoordv - 0.5, 1.0);
    vec2 uv = uv3.xy / uv3.z + 0.5;

	vec2 clampedUV = clamp(uv, vec2(0.0), vec2(2.0));
    gl_FragColor = flixel_texture2D(bitmap, clampedUV);
}