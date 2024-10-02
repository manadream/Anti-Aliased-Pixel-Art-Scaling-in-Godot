# Anti-Aliased Pixel Art Scaling in Godot

This project demonstrates how to use the shader for arbitrary resolution pixel art scaling by [@TylerGlaiel](https://x.com/TylerGlaiel) in Godot v4.3.

See [this Twitter post](https://x.com/TylerGlaiel/status/1580321295379546114) and [this shadertoy](https://www.shadertoy.com/view/csX3RH) for the original source of the shader by Tyler, and [this shadertoy](https://www.shadertoy.com/view/ltfXWS) for the shader that Tyler based it on. Thanks to them for this great pixel art scaling solution.

![demo](https://github.com/manadream/Anti-Aliased-Pixel-Art-Scaling-in-Godot/blob/main/difference_example.gif?raw=true)
![demo](https://github.com/manadream/Anti-Aliased-Pixel-Art-Scaling-in-Godot/blob/main/difference_closeup.gif?raw=true)
![demo](https://github.com/manadream/Anti-Aliased-Pixel-Art-Scaling-in-Godot/blob/main/difference_384x216_to_960x540.gif?raw=true)


## How To Use

The intended usage of this setup in godot is to scale your project from whatever pixel resolution the art is in to the player's screen resolution without the inconsistent pixel sizing that happens with standard fractional scaling.

To use this in your project, do the following:

- Copy `aa_pixel_art_scaler.gdshader` and `sub_viewport_container.gd` to your project
- Under Project Settings > Display > Window:
  - Set `Viewport Width` and `Viewport Height` under `Size` to the width and height of your pixel art resolution size (384x216 is used in this example)
  - Set `Mode` under `Stretch` to `canvas_items`. DO NOT use `viewport` as this will bypass the scaling shader's functionality
    - Leave `Aspect` as `keep`, `Scale` as `1` and `Scale Mode` as `fractional`
- Under Project Settings > Rendering > Textures:
  - Set `Default Texture Filter` under `Canvas Textures` to `Nearest`
- Create a top level scene with a basic `Node` as the root node
  - Add a `SubViewportContainer` to the root
  - Attach the `sub_viewport_container.gd` script to the `SubViewportContainer`
  - Add a `SubViewport` to the `SubViewportContainer`
  - Instantiate your game's scene(s) to the `SubViewport`
- Run the game, mess around with the window size and enjoy your shiny new pixel art scaling!

You can also just use the example project in this repo as a template.