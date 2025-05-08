{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    ## cli ##
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
    ## programming languages ##
    nixfmt-rfc-style
    go
    gcc
    gnumake
    gdb
    cmake
    gradle
    openjdk
    python3
    pipx
    python312Packages.pip
    rustc
    cargo
    ## gui ##
    vscodium
    google-chrome
    telegram-desktop
    whatsapp-for-linux
    ente-auth
    pcloud
    kitty
    gnome-logs
    gnome-music
    gnomeExtensions.blur-my-shell
    gnome-shell
    gnome-extensions-cli
    catppuccin-gtk
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
    ark # p7zip frontend
    ## other ##
    nerdfonts
  ];
}
