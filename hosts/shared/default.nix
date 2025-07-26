{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  hardware.enableRedistributableFirmware = true;

  hardware.openrazer = {
    enable = true;
    batteryNotifier = {
      percentage = 15;
      frequency = 3600;
    };
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
      auto-optimise-store = true;
      warn-dirty = false;
    };
  };

  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = ./grub-theme/catppuccin-mocha-grub-theme;
    };
  };

  # for faster startup
  systemd.services."NetworkManager-wait-online".enable = false;

  networking.networkmanager.enable = true;

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

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "intl";
      };
    };

    printing.enable = true;

    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  console.keyMap = "us-acentos";

  security.rtkit.enable = true;

  users.users.riki = {
    isNormalUser = true;
    description = "riki";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  programs.gamemode.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    neovim
    git
    fish
    gamemode
    gamescope
    os-prober
    gparted
    gnome-shell
    ntfs3g
    openrazer-daemon
    polychromatic
    linuxKernel.packages.linux_zen.xone

    ####### theming #######
    catppuccin-gtk
    catppuccin
    catppuccin-cursors.mochaDark
    gnomeExtensions.blur-my-shell
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  hardware.steam-hardware.enable = true;
  hardware.xone.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
