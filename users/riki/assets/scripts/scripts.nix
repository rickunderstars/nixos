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
        go build -ldflags="-s -w" -o $out/bin/${name} main.go
      '';

  game-of-life = mkGoBin "game-of-life" ./go/game-of-life.go;
  battery-info = mkGoBin "battery-info" ./go/battery-info.go;
  music-info = mkGoBin "music-info" ./go/music-info.go;
  tofi-random = mkGoBin "tofi-random" ./go/tofi-random.go;

  audio-switch = pkgs.writers.writePython3Bin "audio-switch" {
    libraries = [ ];
    flakeIgnore = [
      "E302"
      "E501"
      "E305"
      "W292"
      "E265"
    ];
  } (builtins.readFile ./python/audio-switch.py);

in
{
  home.packages = [
    ### go
    game-of-life
    battery-info
    music-info
    tofi-random

    ### python
    audio-switch
  ];
}
