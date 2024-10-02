shader_type canvas_item;
uniform vec2 content_size;
void fragment(){
  vec2 uv_texspace = UV*content_size;
  vec2 seam = floor(uv_texspace+.5);
  uv_texspace = (uv_texspace-seam)/fwidth(uv_texspace)+seam;
  uv_texspace = clamp(uv_texspace, seam-.5, seam+.5);
  COLOR = texture(TEXTURE,uv_texspace/content_size);
}