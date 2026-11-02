{
  pkgs,
  ...
}:

{
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-vcs-plugin
        thunar-shares-plugin
      ];
    };
    xfconf.enable = true;
    dconf.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = true;
    };
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
