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
    ./term/cava
    ./term/fish
    ./desk-env/hyprland
    ./desk-env/hyprlock
    ./desk-env/waybar
  ];

}
