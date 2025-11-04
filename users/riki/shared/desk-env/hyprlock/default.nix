{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        fail_timeout = 500;
      };

      background = [
        {
          path = "~/nixos-config/users/riki/assets/walls/Cloudsnight.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "320, 80";
          position = "0, 0";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(205, 214, 244)";
          inner_color = "rgb(108, 112, 134)";
          outer_color = "rgba(89b4faff) rgba(cba6f7ff) 310deg";
          font_family = "CaskaydiaCove Nerd Font Mono";
          check_color = "rgb(137, 220, 235)";
          fail_color = "rgb(243, 139, 168)";
          fail_text = ">:P";
          outline_thickness = 5;
          placeholder_text = "▼・ᴥ・▼";
          shadow_passes = 2;
        }
      ];
    };
  };
}
