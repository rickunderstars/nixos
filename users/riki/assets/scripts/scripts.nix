{ pkgs, ... }:

let
  mkGoBin =
    name: src:
    pkgs.runCommand name
      {
        nativeBuildInputs = [ pkgs.go ];
      }
      ''
        mkdir -p $out/bin
        export GOCACHE=$(mktemp -d)
        cp ${src} main.go
        # Compila (aggiunto -s -w per ridurre dimensione binario)
        go build -ldflags="-s -w" -o $out/bin/${name} main.go
      '';

  game-of-life = mkGoBin "game-of-life" ./game-of-life.go;
  battery-info = mkGoBin "battery-info" ./battery-info.go;
  music-info = mkGoBin "music-info" ./music-info.go;

  audio-switch = pkgs.writers.writePython3Bin "audio-switch" {
    libraries = [ ];
    flakeIgnore = [
      "E302"
      "E501"
      "E305"
      "W292"
      "E265"
    ];
  } (builtins.readFile ./audio-switch.py);

in
{
  home.packages = [
    game-of-life
    battery-info
    music-info
    audio-switch
  ];
}
