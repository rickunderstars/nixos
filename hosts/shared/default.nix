{ ... }:

{
  imports = [
    ./core.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./programs.nix
    ./miscellaneous.nix
    ./users.nix
    ./packages.nix
  ];
}
