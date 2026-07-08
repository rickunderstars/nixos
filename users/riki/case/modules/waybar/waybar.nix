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
          "custom/mouse-battery"
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
