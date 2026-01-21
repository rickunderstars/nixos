{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.ghostty = {
    custom-shader = "shaders/cursor_warp.glsl";
  };
}
