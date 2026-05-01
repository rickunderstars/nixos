{
  description = "gopxl dev shell";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      ...
    }:
    let
      system = "x86_64-linux";
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system} = {
        default = unstable.mkShell {
          name = "gopxl";
          buildInputs = with unstable; [
            go
            gopls
            pkg-config
            fish
            libX11
            libXcursor
            libXrandr
            libXinerama
            libXi
            libXxf86vm
            wayland
            libGL
          ];
          shellHook = ''
            export DEV_ENV_NAME="gopxl-dev-env"
          '';
        };
      };
    };
}
