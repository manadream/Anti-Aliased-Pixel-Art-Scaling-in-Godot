extends SubViewportContainer

func _ready() -> void:
  var content_size = get_tree().root.content_scale_size

  var subviewport = $SubViewport as SubViewport
  subviewport.size = content_size
  subviewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS

  texture_filter = TEXTURE_FILTER_LINEAR # VERY IMPORTANT! Will not render with anti aliasing if NEAREST is used
  size = content_size
  material = ShaderMaterial.new()
  material.shader = preload("res://aa_pixel_art_scaler.gdshader")
  material.set_shader_parameter("content_size", content_size)
