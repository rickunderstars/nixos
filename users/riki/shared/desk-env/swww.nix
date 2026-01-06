{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  services.swww = {
    enable = true;
    extraArgs = [

    ];
  };
}
