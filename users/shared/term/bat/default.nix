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
    #config = {
    #  theme = "MyTheme";
    #};
    #themes = {
    # MyTheme = ./catppuccin-mocha.tmTheme;
    #};
  };
}
