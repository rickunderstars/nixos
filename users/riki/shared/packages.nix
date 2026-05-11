{ pkgs, stable, ... }:

{
  home.packages = with pkgs; [

    ####### cli/tui #######
    ookla-speedtest
    zip
    unzip
    wl-clipboard
    bc
    bat-extras.batman
    playerctl
    portal
    bluetuith
    impala
    serie
    wiremix
    pulseaudio
    wl-mirror
    cpufetch
    tdf
    youtube-tui
    exiftool # for superfile metadata plugin
    zoxide # for superfile zoxide plugin
    jq
    wev
    dust
    bit-logo
    mcat
    nix-search-cli

    ####### desk env #######
    hyprpicker
    hyprshade
    papirus-icon-theme
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    turtle
    glib
    gsettings-desktop-schemas

    ####### coding #######
    vscodium
    gitflow
    nixfmt
    gcc
    llvmPackages.clang-tools
    gnumake
    gdb
    cmake
    openjdk
    python3
    texliveFull
    rustc
    cargo
    rustfmt
    arduino-ide
    arduino-language-server
    nodejs
    typst

    ####### shell eye candy #######
    cbonsai
    cmatrix
    pipes
    tty-clock
    astroterm
    countryfetch
    pokemon-colorscripts
    element

    ####### apps #######
    (stable.bottles.override { removeWarningPopup = true; })
    video-trimmer
    gimp
    grimblast
    gsimplecal
    blender
    goxel
    krita
    uxplay
    pavucontrol
    catppuccinifier-gui
    scrcpy
    android-tools
    localsend
    telegram-desktop
    whatsapp-electron
    signal-desktop
    teams-for-linux
    godot_4
    unityhub
    itch
    heroic
    retroarch
    prismlauncher
    protonplus
    prusa-slicer
    cura-appimage
    freecad
    meshlab
    f3d
    wings
    ente-auth
    spotify
    papers
    gedit
    aseprite
    discord
    discover-overlay
    chameleos
    stable.stremio-linux-shell
    fuse
    steam-run
    sgdboop
    boilr
    sm64coopdx
    dolphin-emu
  ];
}
