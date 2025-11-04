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
        timeout = 3;
        font = "CaskaydiaCove Nerd Font Mono 12";
        width = 300;
        notification_height = 200;
        offset = "10x10";
        frame_width = 2;
        corner_radius = 10;

        # catppuccin mavue
        background = "#1e1e2eaf";
        foreground = "#cdd6f4ff";
        frame_color = "#cba6f7e5";
        highlight = "#313244e5";

        icon_position = "left";
        icon_corner_radius = 5;
        max_icon_size = 64;
      };

      urgency_critical = {
        frame_color = "#fab387ff";
        timeout = 0;
      };
    };
  };
}
