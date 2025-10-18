{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    my-dev-shells = {
      url = "./dev-shells";
      inputs.nixpkgs-unstable.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      my-dev-shells,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-stable = nixpkgs.legacyPackages.${system};
      pkgs = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      # nixos tars config
      nixosConfigurations.tars = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          stable = pkgs-stable;
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
                extraSpecialArgs = {
                  stable = pkgs-stable;
                };
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
      nixosConfigurations.case = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          stable = pkgs-stable;
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
                extraSpecialArgs = {
                  stable = pkgs-stable;
                };
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
