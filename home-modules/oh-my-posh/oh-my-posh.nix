{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  my-theme = ./theme.omp.json;
  my-nix-shell-theme = ./theme-nix-shell.omp.json;
  path-exists = builtins.pathExists my-theme;
  path-nix-shell-exists = builtins.pathExists my-nix-shell-theme;
in
{
  programs.oh-my-posh =
    {
      enable = true;
      enableFishIntegration = true;

    }
    // (
      if path-exists then
        {
          settings = builtins.fromJSON (builtins.readFile my-theme);
        }
      else
        {
          useTheme = "di4am0nd";
        }
    );
}
