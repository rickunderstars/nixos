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

    ####### desk env #######
    hyprpicker
    hyprsysteminfo
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
    arduino-ide
    arduino-language-server
    nodejs

    ####### shell eye candy #######
    cbonsai
    cmatrix
    pipes
    tty-clock
    astroterm
    countryfetch
    pokemon-colorscripts

    ####### apps #######
    (bottles.override { removeWarningPopup = true; })
    video-trimmer
    gimp
    grimblast
    gsimplecal
    blender
    krita
    uxplay
    pavucontrol
    catppuccinifier-gui
    scrcpy
    localsend
    telegram-desktop
    whatsapp-electron
    teams-for-linux
    godot_4
    itch
    heroic
    retroarch
    prismlauncher
    protonup-qt
    prusa-slicer
    cura-appimage
    freecad
    stable.meshlab
    f3d
    wings
    ente-auth
    spotify
    papers
    gnome-text-editor
    libresprite
    discord
    discover-overlay
  ];
}
