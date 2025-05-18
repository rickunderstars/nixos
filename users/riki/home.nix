{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.username = "riki";
  home.homeDirectory = "/home/riki";
  home.stateVersion = "24.11";

  imports = [
    ./shared
    ./shared/mimeapps
    ./shared/onedrive
    ./shared/fastfetch
    ./shared/fish
    ./shared/oh-my-posh
    ./shared/ghostty
    ./shared/btop
    ./shared/git
    ./shared/broot
    ./shared/imv
    ./shared/mpv
    ./shared/cava

  ];

  # env variables
  home.sessionVariables = {
  };

  # Tool config model
  #	home.xdg.configFile."<tool-name>/config.toml" = {
  #	source = ./dotfiles/config.toml;
  #	};

  # Scripts model
  #	home.file.".local/bin/<script-name>"
  #	source = ./scripts/<script-name>.sh;
  #	executable = true;
  #	};

}
