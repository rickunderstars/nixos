{ ... }:

{
  programs.waybar = {
    style = ./style.css;
    settings = {
      mainBar = {
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [
        ];
        modules-right = [
          "tray"
          "cava"
          "wireplumber"
          "memory"
          "cpu"
          "bluetooth"
          "network"
          "niri/language"
          "clock"
        ];
        cava = {
          bars = 32;
        };
      };
    };
  };
}
