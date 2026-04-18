{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  services.awww = {
    enable = true;
    extraArgs = [

    ];
  };
}
