{
  description = "ros dev shell";

  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";
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
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-ros-overlay.overlays.default ];
      };
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
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
