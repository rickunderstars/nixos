{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  py-env = pkgs.python3.withPackages (
    ps: with ps; [
      jupyterlab
      notebook
      ipykernel
      pandas
      numpy
      matplotlib
      scikit-learn
      requests
    ]
  );
in
{
  home.packages = with pkgs; [

    ####### cli #######
    gitflow
    bat
    ookla-speedtest
    zip
    unzip
    graphviz
    plantuml
    p7zip
    cbonsai
    pfetch
    cmatrix
    pipes
    cava
    tty-clock
    catppuccin
    nerd-fonts.caskaydia-cove
    nix-your-shell

    ####### programming languages #######
    nixfmt-rfc-style
    go
    gcc
    gnumake
    gdb
    cmake
    gradle
    openjdk
    py-env
    rustc
    cargo

    ####### gui #######
    vscodium
    google-chrome
    telegram-desktop
    whatsapp-for-linux
    ente-auth
    pcloud
    kitty
    gparted
    # cura
    anki
    arduino
    discord
    godot_4
    itch
    meshlab
    wings
    mpvScripts.uosc
    mpvScripts.thumbfast
    spotify
    obsidian
    obs-studio
    onlyoffice-desktopeditors
    qpdfview
    stremio
    catppuccinifier-gui
    libsForQt5.ark

    ####### gnome #######
    gnome-logs
    gnome-music
    gnomeExtensions.blur-my-shell
    gnome-shell
    gnome-extensions-cli
    catppuccin-gtk
  ];
}
