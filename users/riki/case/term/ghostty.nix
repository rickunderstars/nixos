{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.ghostty = {
    settings.custom-shader = "shaders/cursor_warp.glsl";
  };
}
