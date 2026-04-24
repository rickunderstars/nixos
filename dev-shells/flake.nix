{
  description = "dev shells";

  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };

  outputs =
    {
      self,
      nix-ros-overlay,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-ros-overlay.overlays.default ];
      };
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system} = {
        gopxlDev = unstable.mkShell {
          name = "gopxl-shell";
          buildInputs = with unstable; [
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

        rosDev = pkgs.mkShell {
          name = "ros-dev-shell";
          packages = [
            pkgs.colcon
            (
              with pkgs.rosPackages.humble;
              buildEnv {
                paths = [
                  ros-core
                  geometry-msgs
                  sensor-msgs
                ];
              }
            )
          ];
          shellHook = ''
            export DEV_ENV_NAME="ros-dev-env"
          '';
        };
      };
    };
}
