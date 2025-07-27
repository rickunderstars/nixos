{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  script = lib.fileContents ../../../../shared/term/audio-switch/audio-switch.sh;
  outputs = lib.fileContents ./audio-outputs.txt;
in
{
  home.file.".local/bin/audio-switch" = {
    text = script;
    executable = true;
  };

  home.sessionPath = [ "$HOME/.local/bin" ];

  home.file.".config/audio-outputs.txt" = {
    text = outputs;
  };
}
