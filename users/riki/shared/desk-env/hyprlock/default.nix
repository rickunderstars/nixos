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
    };
  };
}
