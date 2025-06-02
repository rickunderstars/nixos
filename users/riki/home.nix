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

  home.packages = with pkgs; [

    ####### cli tools #######
    bat
    ookla-speedtest
    zip
    unzip
    nix-your-shell
    graphviz
    plantuml
    wl-clipboard

    ####### gui tools #######
    catppuccinifier-gui
    obs-studio

    ####### eye candy #######
    cbonsai
    cmatrix
    pipes
    tty-clock

    ####### coding #######
    kitty
    vscodium
    gitflow
    nixfmt-rfc-style
    go
    gcc
    gnumake
    gdb
    cmake
    gradle
    openjdk
    python3
    rustc
    cargo
    arduino

    ####### communication #######
    telegram-desktop
    whatsapp-for-linux
    discord

    ####### games #######
    godot_4
    itch
    heroic

    ####### 3d #######
    prusa-slicer
    openscad
    meshlab
    wings

    ####### browsers #######
    google-chrome

    ####### login #######
    bitwarden-desktop
    ente-auth

    ####### cloud #######
    pcloud

    ####### media #######
    mpvScripts.uosc
    mpvScripts.thumbfast
    spotify
    stremio

    ####### docs and notes #######
    anki
    obsidian
    onlyoffice-desktopeditors
    qpdfview
    zathura
  ];

  imports = [
    ../shared/cloud/onedrive
    ../shared/default-apps
    ../shared/media/imv
    ../shared/media/mpv
    ../shared/system-themeing/cursor
    ../shared/tools/git
    ../shared/term/broot
    ../shared/term/btop
    ../shared/term/cava
    ../shared/term/fastfetch
    ../shared/term/fish
    ../shared/term/ghostty
    ../shared/term/oh-my-posh
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
