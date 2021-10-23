#version 330 core
out vec4 FragColor;

in vec2 TexCoord;

uniform isampler2D ourTexture;
uniform float window;
uniform float level;

void main()
{
    vec4 color = vec4(texture(ourTexture, vec2(TexCoord.x, 1.0 - TexCoord.y)));
    color.rgb = (color.rgb - level + window/2.0f) / window;
    FragColor = clamp(color, 0.0f, 1.0f);
}