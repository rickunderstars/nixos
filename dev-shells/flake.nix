{
  description = "dev shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      nixpkgs-unstable,
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      stable = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      devShells.${system} = {
        # gopxl shell
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

        # python shell for statistics
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

        # "tirocinio" shell
        heartDev = pkgs.mkShell {
          name = "tirocinio";
          buildInputs = with pkgs; [
            gcc
            boost
            llvmPackages.clang-tools
            vscode-extensions.ms-vscode.cpptools
            vscode-extensions.ms-vscode.cpptools-extension-pack
            stable.meshlab
            glm
            nodejs
          ];
          shellHook = ''
            export DEV_ENV_NAME="heart-dev-env"
            source "/home/riki/heart-vis/emsdk/emsdk_env.sh"
            if [ "$(hostname)" = "tars" ]; then
              export QT_SCALE_FACTOR="2"
            fi
          '';
        };
      };
    };
}
