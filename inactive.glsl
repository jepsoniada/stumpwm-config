#version 330
in vec2 texcoord;             // texture coordinate of the fragment

uniform sampler2D tex;        // texture of the window

vec4 default_post_processing(vec4 c);

float contrast = .5;
float brightnesss = .3;

vec4 window_shader() {
  vec4 c = texelFetch(tex, ivec2(texcoord), 0);
  c.rgb = vec3(c.r + c.g + c.b) / 3;
  c.rgb = c.rgb * contrast + vec3(brightnesss);
  return default_post_processing(c);
}
