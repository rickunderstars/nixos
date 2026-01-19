{
  description = "dev shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      stable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system} = {
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
      };
    };
}
