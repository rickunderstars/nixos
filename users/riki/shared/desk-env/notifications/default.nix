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
        offset = "20x20";
        frame_width = 2;
        corner_radius = 5;

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

  /*
    services.mako = {
      enable = true;
      settings = {
        default-timeout = 3000;
        font = "CaskaydiaCove Nerd Font Mono 12";
        background-color = "#1e1e2eaf";
        text-color = "#cdd6f4ff";
        border-color = "#cba6f7e5";
        progress-color = "over #313244e5";
        width = 300;
        height = 200;
        border-size = 2;
        border-radius = 5;
        margin = 20;
        icon-border-radius = 5;
        format = "<b>%s</b>\\n%b";
        "urgency=high" = {
          border-color = "#fab387ff";
        };

      };
    };
  */
}
