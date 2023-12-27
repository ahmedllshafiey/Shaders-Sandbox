vec3 Cricle(float radius, vec2 uv, float range) {

    float value = range * cos(iTime);

    float circle = step(clamp(value, 0., .8), length(uv - 0.5));

    vec3 color = vec3(radius * sin(0.5 * iTime), radius * sin(0.5 * iTime), radius * sin(0.5 * iTime));

    color += circle;

    return color;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;

    vec3 circleA = Cricle(1.0, uv, 0.5);

    vec3 circleB = Cricle(0.9, uv, 0.4);

    vec3 circleC = Cricle(0.8, uv, 0.3);

    vec3 circleD = Cricle(0.7, uv, 0.2);

    vec3 circleE = Cricle(0.6, uv, 0.1);

    vec3 color;

    color += circleA;
    color += circleB;
    color += circleC;
    color += circleD;
    color += circleE;

    fragColor = vec4(color, 1.0);
}
