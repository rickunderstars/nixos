{
  pkgs,
  stable,
  lib,
  config,
  inputs,
  ...
}:

{
  home = {
    username = "riki";
    homeDirectory = "/home/riki";

    packages = with pkgs; [

      ####### cli #######
      ookla-speedtest
      zip
      unzip
      graphviz
      plantuml
      wl-clipboard
      bc
      tldr
      bat-extras.batman
      trash-cli
      playerctl
      coreutils

      (bottles.override { removeWarningPopup = true; })

      ####### desk env #######
      hyprpicker
      hyprsysteminfo
      bluetuith # bluetooth
      papirus-icon-theme
      nautilus
      kdePackages.breeze

      ####### coding #######
      vscodium
      gitflow
      nixfmt-rfc-style
      gcc
      llvmPackages.clang-tools
      gnumake
      gdb
      cmake
      openjdk
      python3
      rustc
      cargo
      arduino-ide
      arduino-language-server

      ####### shell eye candy #######
      cbonsai
      cmatrix
      pipes
      tty-clock

      ####### apps #######
      gimp
      grimblast
      blender
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
      openscad
      stable.meshlab
      wings
      ente-auth
      pcloud.passthru.libnotify or pkgs.libnotify
      spotify
      kdePackages.okular
      libresprite
    ];
  };

  programs = {
    ####### cli #######
    nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
      ];
    };
    translate-shell.enable = true;

    ####### apps #######
    vesktop.enable = true;
    obs-studio.enable = true;
    firefox.enable = true;
    anki.enable = true;
    obsidian.enable = true;
    micro = {
      enable = true;
      settings = {
        autosave = 5;
        softwrap = true;
        wordwrap = true;
        autoclose = true;
        colorscheme = "catppuccin-mocha";
      };
    };
    onlyoffice = {
      enable = true;
      settings = {
        UITheme = "theme-contrast-dark";
      };
    };
    mangohud = {
      enable = true;
      settings = {
        preset = 1;
        background_alpha = 0;
      };
    };

    ####### coding #######
    go.enable = true;
    gradle.enable = true;
  };

  services = {
    network-manager-applet.enable = true;
    clipman.enable = true;
    tldr-update.enable = true;
    playerctld.enable = true;
    udiskie = {
      enable = true;
      settings = {
        program_options = {
          file_manager = "${pkgs.nautilus}/bin/nautilus";
        };
      };
    };

    easyeffects.enable = true;
    hyprpolkitagent.enable = true;
    gnome-keyring = {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
        "ssh"
      ];
    };
  };

  home = {
    file = {
      ".config/micro/colorschemes/catppuccin-mocha.micro" = {
        source = ./assets/micro/catppuccin-mocha.micro;
      };
      ".arduinoIDE/.clang-format" = {
        source = ./assets/arduino/.clang-format;
      };
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
    };
  };

  imports = [
    ./shared/mimeapps
    ./shared/apps/onedrive
    ./shared/apps/imv
    ./shared/apps/mpv
    ./shared/apps/git
    ./shared/term/broot
    ./shared/term/btop
    ./shared/term/cava
    ./shared/term/fastfetch
    ./shared/term/fish
    ./shared/term/ghostty
    ./shared/term/starship
    ./shared/term/bat
    ./shared/desk-env/hyprland
    ./shared/desk-env/hypridle
    ./shared/desk-env/hyprlock
    ./shared/desk-env/hyprpaper
    ./shared/desk-env/hyprshell
    ./shared/desk-env/cursor
    ./shared/desk-env/waybar
    ./shared/desk-env/notifications
    ./shared/desk-env/global-themes
  ];
}
