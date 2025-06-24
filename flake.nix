{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    my-dev-shells.url = "./dev-shells";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      my-dev-shells,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # nixos tars config
      nixosConfigurations.tars = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/tars/configuration.nix
          home-manager.nixosModules.home-manager
          (
            { pkgs, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.riki = {
                  imports = [
                    ./users/riki/home.nix
                    ./users/riki/tars/home.nix
                  ];
                };
              };
            }
          )

        ];
      };

      # nixos case config
      nixosConfigurations.case = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/case/configuration.nix
          home-manager.nixosModules.home-manager
          (
            { pkgs, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.riki = {
                  imports = [
                    ./users/riki/home.nix
                    ./users/riki/case/home.nix
                  ];
                };
              };
            }
          )

        ];
      };

      devShells.${system} = my-dev-shells.devShells.${system};

    };
}
