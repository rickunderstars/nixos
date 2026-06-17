{
  pkgs,
  stable,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    ####### cli/tui #######
    inputs.pomo.packages.${pkgs.stdenv.hostPlatform.system}.default
    (writeShellScriptBin "xdg-open" ''exec ${glib}/bin/gio open "$@"'')
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
    caligula
    kalker

    ####### desk env #######
    hyprpicker
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
    kdlfmt
    nixd
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
    tinymist

    ####### shell eye candy #######
    cbonsai
    cmatrix
    unimatrix
    nsnake
    bastet
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
    blender
    krita
    uxplay
    pavucontrol
    catppuccinifier-gui
    scrcpy
    android-tools
    localsend
    ayugram-desktop
    whatsapp-electron
    signal-desktop
    teams-for-linux
    godot_4
    unityhub
    itch
    heroic
    retroarch
    (symlinkJoin {
      name = "prismlauncher-wrapped";
      paths = [ prismlauncher ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/prismlauncher \
          --set QT_QPA_PLATFORMTHEME ""
      '';
    })

    protonplus
    prusa-slicer
    cura-appimage
    freecad
    meshlab
    f3d
    wings
    ente-auth
    spotify
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
    quickemu
    yt-dlp
  ];
}
