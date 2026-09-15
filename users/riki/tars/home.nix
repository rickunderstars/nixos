{
  pkgs,
  ...
}:

{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    geteduroam
    (pkgs.symlinkJoin {
      name = "unityhub-wrapped";
      paths = [ pkgs.unityhub ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/unityhub \
          --set GDK_SCALE "2"
      '';
    })
  ];

  imports = [
    ./modules
  ];

}
