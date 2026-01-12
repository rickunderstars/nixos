{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        timeout = 2;
        font = "CaskaydiaCove Nerd Font Mono 12";
        width = 300;
        height = "(0, 300)";
        offset = "5x5";
        frame_width = 2;
        corner_radius = 10;
        follow = "mouse";
        icon_position = "left";
        icon_corner_radius = 5;
        max_icon_size = 64;
        alignment = "center";

        # catppuccin mavue
        background = "#1e1e2ed5";
        foreground = "#cdd6f4ff";
        frame_color = "#cba6f7ff";
        highlight = "#313244ff";
      };

      urgency_critical = {
        frame_color = "#fab387ff";
        timeout = 10;
      };
    };
  };
}
