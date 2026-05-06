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

      turtlesim-scaled = pkgs.rosPackages.humble.turtlesim.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeWrapper ];
        postFixup = (old.postFixup or "") + ''
          wrapProgram $out/lib/turtlesim/turtlesim_node \
            --set QT_SCALE_FACTOR 1
        '';
      });

    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          name = "ros";
          packages = [
            # non-ROS pkgs
            pkgs.colcon
            pkgs.libsForQt5.qtwayland
          ]
          ++ (with pkgs.rosPackages.humble; [
            # ROS pkgs
            ros-core
            geometry-msgs
            sensor-msgs
            turtlesim-scaled
            rqt
            rqt-common-plugins
            ament-cmake
            rclcpp
            rclcpp-components
            std-msgs
            example-interfaces
            rclpy
          ]);

          shellHook = ''
            export DEV_ENV_NAME="ros-dev-env"

            unset QT_STYLE_OVERRIDE
            unset QT_QPA_PLATFORMTHEME
            unset QML2_IMPORT_PATH
          '';
        };
      };
    };
}
