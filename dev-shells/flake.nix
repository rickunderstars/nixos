{
  description = "dev shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    emscripten-pin.url = "github:nixos/nixpkgs/6d662c5";
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nixpkgs,
      emscripten-pin,
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

      pkgsEmscripten = import emscripten-pin {
        inherit system;
        config.allowUnfree = true;
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

        # "tirocinio" shell
        heartDev = pkgs.mkShell {
          name = "tirocinio";
          buildInputs = with pkgs; [
            gcc
            cmake
            bear
            boost
            llvmPackages.clang-tools
            vscode-extensions.ms-vscode.cpptools
            vscode-extensions.ms-vscode.cpptools-extension-pack
            stable.meshlab
            pkgsEmscripten.emscripten
            glm
            python3
            nodejs
          ];
          shellHook = ''
            export DEV_ENV_NAME="heart-dev-env"
            export GLM_INCLUDE_DIR="${pkgs.glm}/include"
            export BOOST_INCLUDE_DIR="${pkgs.boost.dev}/include"
            export EM_CACHE="$PWD/.emscripten_cache"

            if [ "$(hostname)" = "tars" ]; then
             export QT_SCALE_FACTOR="2"
            fi

            if [ ! -f .clangd ] || [ .clangd -ot "$0" ]; then
              cat > .clangd << 'EOF'
              CompileFlags:
               CompilationDatabase: build
              Diagnostics:
               UnusedIncludes: None
               MissingIncludes: None
              EOF
            fi
          '';
        };
      };
    };
}
