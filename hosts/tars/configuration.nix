{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
  ];

  # for faster startup
  systemd.services."NetworkManager-wait-online".enable = false;

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest; # keyboard  fix (key repeat)

  # hostname
  networking.hostName = "tars";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # enable networking
  networking.networkmanager.enable = true;

  # set time zone
  time.timeZone = "Europe/Rome";

  # select internationalisation properties
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
    # disable gnome power profile management
    power-profiles-daemon.enable = false;

    # enable tlp power profile management
    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";

        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 0;

        START_CHARGE_THRESH_BAT1 = 0;
        STOP_CHARGE_THRESH_BAT1 = 0;
      };
    };

    xserver = {
      # enable the X11 windowing system
      enable = true;

      # amd video drivers
      videoDrivers = [ "amdgpu" ];

      # enable the gnome desktop environment
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # configure keymap in x11
    xserver.xkb = {
      layout = "us";
      variant = "intl";
    };

    # enable cups to print documents
    printing.enable = true;

    # enable sound with pipewire
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

  # configure console keymap
  console.keyMap = "us-acentos";

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # user account
  users.users.riki = {
    isNormalUser = true;
    description = "riki";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  # enable fish
  programs.fish.enable = true;

  # enable gamemode
  programs.gamemode.enable = true;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # system packages
  environment.systemPackages = with pkgs; [
    wget
    neovim
    git
    fish
    gamemode

  ];

  # steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
