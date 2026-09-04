{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs-unstable";
        home-manager.follows = "home-manager";
      };
    };

    gopxl-shell = {
      url = "./dev-shells/gopxl";
      inputs.nixpkgs-unstable.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nix-cachyos-kernel,
      home-manager,
      gopxl-shell,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
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
          {
            nix.settings = {
              substituters = [
                "https://attic.xuyh0120.win/lantian"
                "https://cache.xinux.uz"
              ];
              trusted-public-keys = [
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
                "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
              ];
            };
            nixpkgs.overlays = [
              nix-cachyos-kernel.overlays.pinned
            ];
          }
          (
            { pkgs, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = {
                  stable = pkgs-stable;
                  inherit inputs;
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
          {
            nix.settings = {
              substituters = [ "https://attic.xuyh0120.win/lantian" ];
              trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
            };
            nixpkgs.overlays = [
              nix-cachyos-kernel.overlays.pinned
            ];
          }
          (
            { pkgs, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = {
                  stable = pkgs-stable;
                  inherit inputs;
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

      devShells.${system} = {
        gopxlDev = gopxl-shell.devShells.${system}.default;
      };

    };
}
