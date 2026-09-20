{
  pkgs,
  ...
}:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    razer-cli
    nvitop
    deadlock-mod-manager
  ];

  imports = [
    ./modules
  ];

}
