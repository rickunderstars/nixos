{
  pkgs,
  stable,
  lib,
  config,
  inputs,
  ...
}:

{

  hardware = {
    # proprietary firmware
    enableRedistributableFirmware = true;

    # bluetooth
    bluetooth.enable = true;

    # steam hardware
    steam-hardware.enable = true;

    # xbox one accessories
    xone.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      download-buffer-size = 1048576000;
      auto-optimise-store = true;
      warn-dirty = false;
    };
  };

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
    "btrfs"
    "ext4"
  ];

  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = ../assets/grub/bsol;
    };
  };

  systemd.services = {
    # for faster startup
    "NetworkManager-wait-online".enable = false;
  };

  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        # localsend
        53317

        # uxplay
        5353
        7000
        7001
        7100
      ];
      allowedUDPPorts = [
        53317

        5353
        6000
        6001
        7011

      ];
    };
  };

  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
  };

  # lock
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.hyprlock = {
      text = ''
        auth include login
      '';
    };
  };

  # hints apps to use ozone
  environment.sessionVariables.NIXOS_OZONE_WL = "auto";

  services = {
    # autologin
    getty.autologinUser = "riki";

    # ignore power key
    logind.settings.Login.HandlePowerKey = "ignore";

    # virtual file-system
    gvfs.enable = true;

    udisks2.enable = true;

    gnome = {
      # gnome-keyring (for ente-auth)
      gnome-keyring.enable = true;
      gnome-settings-daemon.enable = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      openFirewall = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
        hinfo = true;
        userServices = true;
      };
    };

    # audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # printing
    printing.enable = true;
  };

  console.keyMap = "us-acentos";

  users.users.riki = {
    isNormalUser = true;
    description = "riki";
    extraGroups = [
      "networkmanager"
      "bluetooth"
      "wheel"
      "openrazer"
      "dialout"
      "uucp"
      "audio"
      "video"
      "input"
      "plugdev"
      "storage"
    ];
    shell = pkgs.fish;
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [

    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    os-prober
    gparted
    brightnessctl
    procps

    ####### desk env #######
    hyprland-qt-support
    hyprpolkitagent
    exfatprogs
    dosfstools
    quickshell

    ####### theming #######
    catppuccin
    catppuccin-cursors.mochaDark
  ];

  programs = {

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    fish.enable = true;
    gamemode.enable = true;
    gamescope = {
      enable = true;
    };
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  qt.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "hyprland";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];

}
