{
  config,
  pkgs,
  lib,
  ...
}:

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
    onedrive
    nerdfonts

    ####### programming languages #######
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
    discord # to-remove
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
    ark

    ####### gnome #######
    gnome-logs # to-remove
    gnome-music # to-remove
    gnomeExtensions.blur-my-shell # to-remove
    gnome-shell # to-remove
    gnome-extensions-cli # to-remove
    catppuccin-gtk # to-remove

    ####### hyprland #######
    # aquamarine
    # hyprlang
    # hyprcursor
    # hyprutils
    # uwsm
    # greetd.greetd
    # greetd.regreet
    # wireplumber
    # dunst
    # waybar
    # hyprpaper
    # xdg-desktop-portal-hyprland
    # xwayland
    # rofi-wayland
    # webcord
    # hyprpicker
    # clipse
    # nautilus
    # nautilus-open-any-terminal
    # hyprsome
    # networkmanagerapplet
    # udiskie
    # hyprpolkitagent
    # hypridle
    # hyprlock
    # hyprcursor
    # hyprutils
    # hyprwayland-scanner
    # hyprland-monitor-attached
    # hyprland-workspaces
  ];
}
