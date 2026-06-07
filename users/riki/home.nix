{
  pkgs,
  config,
  inputs,
  ...
}:

{
  home = {
    username = "riki";
    homeDirectory = "/home/riki";

    packages = [ ];
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
          location = "${config.home.homeDirectory}/Pictures/Screenshots";
        }
        {
          name = "Onedrive";
          location = "${config.home.homeDirectory}/OneDrive";
        }
      ];
      metadataPackage = pkgs.exiftool;
      zoxidePackage = pkgs.zoxide;
    };

    ####### apps #######
    zen-browser.enable = true;
    obs-studio.enable = true;
    firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };
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
    gemini-cli.enable = true;
    # NEXT UPDATE
    # antigravity-cli.enable = true;
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

      # using mkOutOfStoreSymlink avoids copying files
      ".assets".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/users/riki/assets";
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
      extraConfig = {
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    desktopEntries = {
      onlyoffice-desktopeditors = {
        name = "OnlyOffice";
        exec = "env QT_SCALE_FACTOR=1 onlyoffice-desktopeditors %U";
        terminal = false;
        categories = [ "Office" ];
      };
      youtube = {
        name = "YouTube";
        exec = "zen-twilight --new-window https://www.youtube.com";
        terminal = false;
        categories = [
          "Network"
          "Video"
        ];
      };
      instagram = {
        name = "Instagram";
        exec = "zen-twilight --new-window https://www.instagram.com";
        terminal = false;
        categories = [
          "Network"
          "InstantMessaging"
          "Chat"
          "Photography"
        ];
      };
    };
  };

  imports = [
    inputs.zen-browser.homeModules.twilight
    ./assets/scripts/scripts.nix
    ./shared/modules
    ./shared/packages.nix
  ];
}
