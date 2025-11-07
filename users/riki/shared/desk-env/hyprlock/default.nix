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
        fail_timeout = 700;
      };
      background = [
        {
          path = "~/nixos-config/users/riki/assets/walls/Cloudsnight.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      label = [
        {
          text = "$TIME";
          text_align = "left";
          halign = "left";
          valign = "top";
          color = "rgba(205, 214, 244, 1.0)";
          font_size = 30;
          font_family = "CaskaydiaCove Nerd Font Mono";
          position = "20, -20";
          shadow_passes = 2;
        }
        {
          text = "cmd[update:5000] date +'%a %d-%b-%Y'";
          text_align = "left";
          halign = "left";
          valign = "top";
          color = "rgba(205, 214, 244, 1.0)";
          font_size = 30;
          font_family = "CaskaydiaCove Nerd Font Mono";
          position = "20, -70";
          shadow_passes = 2;
        }
        {
          text = "~$USER";
          text_align = "center";
          halign = "right";
          valign = "top";
          color = "rgba(205, 214, 244, 1.0)";
          font_size = 30;
          font_family = "CaskaydiaCove Nerd Font Mono";
          position = "-20, -20";
          shadow_passes = 2;
        }
      ];
    };
  };
}
