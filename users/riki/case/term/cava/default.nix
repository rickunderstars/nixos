{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.cava = {
    settings = {
      general.framerate = 144;
    };
  };
}
