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
        "~/nixos-config/users/riki/assets/walls/Cloudsnight.jpg"
        "~/nixos-config/users/riki/assets/walls/evening-sky.png"

      ];
      wallpaper = [
        ", ~/nixos-config/users/riki/assets/walls/Cloudsnight.jpg"
      ];
    };
  };
}
