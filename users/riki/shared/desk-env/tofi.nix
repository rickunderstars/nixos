{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.tofi = {
    enable = true;
    settings = {
      font = "CaskaydiaCove Nerd Font Mono";
      font-size = "16vh";
      prompt-text = "run?";
      placeholder-text = "   but i don't like running...";
      prompt-padding = 16;
      height = "100%";
      width = "100%";
      padding-left = "10%";
      padding-top = "16%";
      padding-bottom = "10%";
      outline-width = 0;
      border-width = 0;
      hide-cursor = true;
      history = true;
      drun-launch = true;

      # catppuccin mocha
      text-color = "#cdd6f4";
      prompt-color = "#eba0ac";
      selection-color = "#89dceb";
      background-color = "#1e1e2ee0";
    };
  };
}
