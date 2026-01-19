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
      stable.vscodium
      gitflow
      nixfmt-rfc-style
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
  };

  programs = {
    ####### cli/tui #######
    nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
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
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    superfile = {
      enable = true;
      settings = {
        theme = "catppuccin";
        auto_check_update = false;
        transparent_background = true;
        default_open_file_preview = true;
        shell_close_on_success = true;
        show_image_preview = true;
        default_sort_type = 2;
        case_sensitive_sort = false;
        code_previewer = "bat";
        nerdfont = true;
        metadata = true;
        zoxide_support = true;
      };
      pinnedFolders = [
        {
          name = "Screenshots";
          location = "/home/riki/Pictures/Screenshots";
        }
        {
          name = "Onedrive";
          location = "/home/riki/OneDrive";
        }
      ];
      metadataPackage = pkgs.exiftool;
      zoxidePackage = pkgs.zoxide;
    };

    ####### apps #######
    zen-browser.enable = true;
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
    gemini-cli = {
      enable = true;
      defaultModel = "gemini-3-pro";
    };
  };

  services = {
    # network-manager-applet.enable = true; # requires   networking.networkmanager.enable in system config
    clipman.enable = true;
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
    pointerCursor = {
      gtk.enable = true;
      enable = true;
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
    };
    file = {
      ".config/micro/colorschemes/catppuccin-mocha.micro" = {
        source = ./assets/micro/catppuccin-mocha.micro;
      };
      ".arduinoIDE/.clang-format" = {
        source = ./assets/arduino/.clang-format;
      };
      ".config/ghostty/shaders/cursor_warp.glsl" = {
        source = ./assets/ghostty/cursor_warp.glsl;
      };
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    desktopEntries = {
      freecad = {
        name = "FreeCAD";
        exec = "env QT_QPA_PLATFORM=xcb freecad %U";
        terminal = false;
        categories = [ "Application" ];
      };
      onlyoffice-desktopeditors = {
        name = "ONLYOFFICE";
        exec = "env QT_SCALE_FACTOR=1 onlyoffice-desktopeditors %U";
        terminal = false;
        categories = [ "Office" ];
      };
    };
  };

  imports = [
    inputs.zen-browser.homeModules.twilight
    ./assets/scripts/scripts.nix
    ./shared/apps/onedrive.nix
    ./shared/apps/imv.nix
    ./shared/apps/mpv.nix
    ./shared/apps/git.nix
    ./shared/term/broot.nix
    ./shared/term/btop.nix
    ./shared/term/cava.nix
    ./shared/term/fastfetch.nix
    ./shared/term/fish.nix
    ./shared/term/ghostty.nix
    ./shared/term/starship.nix
    ./shared/term/bat.nix
    ./shared/desk-env/mimeapps.nix
    ./shared/desk-env/hyprland.nix
    ./shared/desk-env/hypridle.nix
    ./shared/desk-env/hyprlock.nix
    ./shared/desk-env/swww.nix
    ./shared/desk-env/hyprshell.nix
    ./shared/desk-env/tofi.nix
    ./shared/desk-env/waybar.nix
    ./shared/desk-env/dunst.nix
    ./shared/desk-env/global-themes.nix
  ];
}
