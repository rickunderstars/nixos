{ ... }:

{
  imports = [
    ./core.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./users.nix
    ./packages.nix
  ];
}
