void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 st = fragCoord.xy / iResolution.xy;

    float y = step(0.5, st.x);

    vec3 color = vec3(y);

    float pct = step(0.5, st.x);
    color = mix(color, vec3(0.0, 0.5, 1.0), pct);

    fragColor = vec4(color, 1.0);
}
