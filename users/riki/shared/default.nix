{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [

    ####### cli #######
    bat
    ookla-speedtest
    zip
    unzip
    cbonsai
    pfetch
    cmatrix
    pipes
    tty-clock

    ####### programming #######
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

    ####### other #######
    catppuccin
    nerd-fonts.caskaydia-cove
    nix-your-shell
    graphviz
    plantuml
    p7zip

  ];
}
