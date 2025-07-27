{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];

  imports = [
    ./term/audio-switch
    ./term/cava
    ./term/fish
  ];

}
