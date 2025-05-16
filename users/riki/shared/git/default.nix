{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "riki";
    userEmail = "rickunderstars@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
}
