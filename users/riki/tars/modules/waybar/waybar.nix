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
          "backlight"
          "idle_inhibitor"
          "memory"
          "cpu"
          "battery"
          "bluetooth"
          "network"
          "niri/language"
          "clock"
        ];
        cava = {
          bars = 12;
        };
      };
    };
  };
}
