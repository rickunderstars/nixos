{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # nixos config
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
                  imports = [ ./users/riki/home.nix ];
                };
              };
            }
          )

        ];
      };

      devShells.${system} = {

        # global gopxl shell
        gopxlDev = pkgs.mkShell {
          name = "gopxl-shell";
          buildInputs = with pkgs; [
            go
            gopls
            pkg-config
            fish
            xorg.libX11
            xorg.libXcursor
            xorg.libXrandr
            xorg.libXinerama
            xorg.libXi
            xorg.libXxf86vm
            wayland
            libGL
          ];
          shellHook = ''
            export DEV_ENV_NAME="gopxl-dev-env"
          '';
        };

        # global python shell for statistics
        statDev = pkgs.mkShell {
          name = "py-stat-shell";
          buildInputs = with pkgs; [
            python3
            python3Packages.pip
            python3Packages.virtualenv
            python3Packages.jupyter
            python3Packages.numpy
            python3Packages.pandas
            python3Packages.matplotlib
            python3Packages.graphviz
            python3Packages.scipy
            python3Packages.scikit-learn
            # python3Packages.rogeriopradoj-paretochart
            python3Packages.statsmodels
            python3Packages.ipywidgets
          ];
          shellHook = ''
            export DEV_ENV_NAME="stat-dev-env"
          '';
        };
      };
    };
}
