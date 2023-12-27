vec3 rgb(float r, float g, float b) {
    return vec3(r / 255.0, (g / 255.0), (b / 255.0));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 st = fragCoord.xy / iResolution.xy;

    vec3 colorA = rgb(200.0, 150.0, 58.0);
    vec3 colorB = rgb(145.0, 235.0, 186.0);

    vec3 color_mix = vec3(mix(colorA, colorB, abs(sin(iTime))));

    float pct = distance(st, vec2(0.5, 0.5));

    vec3 smooth_trans = smoothstep(0.1, 0.5, vec3(pct += 0.2, color_mix.y, color_mix.z));

    fragColor = vec4(smooth_trans, 1.0);
}
