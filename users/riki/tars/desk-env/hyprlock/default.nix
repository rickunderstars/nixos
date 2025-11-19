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
          size = 300;
          rounding = -1;
          border_size = 4;
          border_color = "rgba(89b4faff) rgba(cba6f7ff) 310deg";
          position = "0, 120";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
        }
      ];
      input-field = [
        {
          size = "600, 100";
          position = "0, -180";
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
          outline_thickness = 4;
          placeholder_text = "ᓚᘏᗢ";
          shadow_passes = 2;
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
          monitor = "eDP-1";
        }
        {
          text = "cmd[update:5000] /home/riki/nixos-config/users/riki/assets/scripts/battery";
          text_align = "center";
          halign = "right";
          valign = "bottom";
          color = "rgba(166, 227, 161, 1.0)";
          font_size = 30;
          font_family = "CaskaydiaCove Nerd Font Mono";
          position = "-20, 20";
          shadow_passes = 2;
        }
        {
          text = "rickunderstars@gmail.com";
          text_align = "center";
          halign = "left";
          valign = "bottom";
          color = "rgba(205, 214, 244, 1.0)";
          font_size = 30;
          font_family = "CaskaydiaCove Nerd Font Mono";
          position = "20, 20";
          shadow_passes = 2;
          monitor = "eDP-1";
        }
        {
          text = "cmd[update:100] /home/riki/nixos-config/users/riki/assets/scripts/game-of-life";
          text_align = "center";
          halign = "right";
          valign = "center";
          color = "rgba(205, 214, 244, 1.0)";
          font_size = 7;
          font_family = "CaskaydiaCove Nerd Font Mono";
          position = "-20, 0";
          shadow_passes = 2;
        }
      ];
    };
  };
}
