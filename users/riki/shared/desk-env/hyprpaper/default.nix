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
        "~/nixos-config/users/riki/shared/desk-env/hyprpaper/puffy-stars.jpg"
      ];
      wallpaper = [
        ", ~/nixos-config/users/riki/shared/desk-env/hyprpaper/puffy-stars.jpg"
      ];
    };
  };
}
