{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    geteduroam # eduroam
  ];

  home.sessionVariables = {
    # tells x11 (gdk) apps to scale x2
    GDK_SCALE = "2";

    # solves clipboard problems
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  imports = [
    ./term/cava
    ./term/fish
    ./desk-env/hyprland
    ./desk-env/hypridle
    ./desk-env/hyprlock
    ./desk-env/waybar
  ];

}
