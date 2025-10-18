{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    settings = {
      font-family = "CaskaydiaCove Nerd Font Mono";
      font-size = 12;
      theme = "Catppuccin Mocha";
      background-opacity = 0.9;
      background-blur = true;
      mouse-hide-while-typing = true;
      maximize = true;
      window-padding-x = 16;
      window-padding-y = 16;
      window-padding-balance = true;
      window-decoration = "server";
    };
  };
}
