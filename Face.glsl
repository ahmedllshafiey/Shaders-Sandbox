float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p);
    float c = smoothstep(r, r - blur, d);
    return c;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;

    uv.x *= iResolution.x / iResolution.y;

    float mask = Circle(uv, vec2(0.5, 0.5), 0.3, 0.003);

    mask -= Circle(uv, vec2(0.4, 0.64), 0.05, 0.003);

    mask -= Circle(uv, vec2(0.6, 0.64), 0.05, 0.003);

    vec3 color = vec3(1., 0, 1.);

    color = vec3(1., 1, 0.) * mask;

    fragColor = vec4(color, 1.0);
}