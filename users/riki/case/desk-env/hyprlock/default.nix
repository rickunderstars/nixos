{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  programs.hyprlock = {
    settings = {
      image = [
        {
          path = "~/nixos-config/users/riki/assets/avatar/marcille.jpg";
          halign = "center";
          valign = "center";
          position = "0, 80";
          size = 180;
          rounding = -1;
          border_size = 4;
          border_color = "rgba(89b4faff) rgba(cba6f7ff) 310deg";
          shadow_passes = 2;
          monitor = "DP-3";
        }
      ];
      input-field = [
        {
          halign = "center";
          valign = "center";
          position = "0, -120";
          size = "360, 60";

          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(205, 214, 244)";
          inner_color = "rgb(108, 112, 134)";
          outer_color = "rgba(89b4faff) rgba(cba6f7ff) 310deg";
          shadow_passes = 2;
          font_family = "CaskaydiaCove Nerd Font Mono";
          check_color = "rgb(137, 220, 235)";
          fail_color = "rgb(243, 139, 168)";
          fail_text = ">:P";
          outline_thickness = 4;
          placeholder_text = "ᓚᘏᗢ";
          monitor = "DP-3";
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
          monitor = "DP-3";
        }
      ];
    };
  };
}
