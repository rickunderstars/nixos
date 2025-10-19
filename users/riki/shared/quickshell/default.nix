{
  pkgs,
  stable,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.quickshell = {
    enable = true;
  };
}
