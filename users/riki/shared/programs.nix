{
  config,
  ...
}:

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
    antigravity-cli.enable = true;
    claude-code.enable = true;
    zathura.enable = true;
    bat.enable = true;
    broot.enable = true;
    btop.enable = true;
    cava.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    eza.enable = true;
    fastfetch.enable = true;
    firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };
    fish.enable = true;
    ghostty.enable = true;
    kitty.enable = true;
    git.enable = true;
    delta = {
      enable = true;
      enableJujutsuIntegration = true;
    };
    ssh.enable = true;
    hyprlock.enable = true;
    imv.enable = true;
    mangohud.enable = true;
    micro.enable = true;
    mpv.enable = true;
    onedrive.enable = true;
    onlyoffice = {
      enable = true;
      settings.UITheme = "theme-contrast-dark";
    };
    starship.enable = true;
    superfile.enable = true;
    tofi.enable = true;
    waybar.enable = true;
    jujutsu.enable = true;
  };

  gtk.enable = true;
  qt.enable = true;
}
