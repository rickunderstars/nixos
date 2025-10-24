{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/nixos-config/users/riki/assets/walls/puffy-stars.jpg"
      ];
      wallpaper = [
        ", ~/nixos-config/users/riki/assets/walls/puffy-stars.jpg"
      ];
    };
  };
}
