{
  pkgs,
  ...
}:

{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    geteduroam
  ];

  imports = [
    ./modules
  ];

}
