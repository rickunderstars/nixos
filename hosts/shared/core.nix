{ inputs, ... }:

{
  nix = {
    registry = {
      nixpkgs.flake = inputs.nixpkgs-unstable;
      stable.flake = inputs.nixpkgs;
    };
    nixPath = [
      "nixpkgs=${inputs.nixpkgs-unstable}"
      "stable=${inputs.nixpkgs}"
    ];
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

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Rome";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "en_US.UTF-8/UTF-8"
      "it_IT.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_ADDRESS = "it_IT.UTF-8";
      LC_IDENTIFICATION = "it_IT.UTF-8";
      LC_MEASUREMENT = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_NAME = "it_IT.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TIME = "en_GB.UTF-8";
      LC_TELEPHONE = "it_IT.UTF-8";
      LC_NUMERIC = "C";
    };
  };

  console.keyMap = "us-acentos";
}
