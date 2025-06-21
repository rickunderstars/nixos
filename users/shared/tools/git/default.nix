{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "riki";
    userEmail = "rickunderstars@gmail.com";
    extraConfig.init.defaultBranch = "main";
    delta = {
      enable = true;
      options = {
        features = "catppuccin-mocha";
        side-by-side = true;
      };
    };
    includes = [
      {
        path = ./catppuccin.gitconfig;
      }
    ];
  };
}
