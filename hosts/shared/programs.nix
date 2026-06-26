{ ... }:

{
  programs = {
    dconf.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
    niri = {
      enable = true;
      useNautilus = true;
    };
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

  qt.enable = true;
}
