{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.bat = {
    enable = true;
    themes = {
      catppuccin-mocha = builtins.readFile ./catppuccin-mocha.tmTheme;
    };
    config = {
      theme = "catppuccin-mocha";
    };
  };
}
