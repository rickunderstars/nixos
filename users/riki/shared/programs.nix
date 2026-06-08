{ pkgs, ... }:

{
  programs = {
    nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
    };
    translate-shell.enable = true;
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    zen-browser.enable = true;
    anki.enable = true;
    obsidian.enable = true;
    go.enable = true;
    gradle.enable = true;
    gemini-cli.enable = true;
    claude-code.enable = true;
  };
}
