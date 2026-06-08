{
  pkgs,
  lib,
  ...
}:

{

  services.hyprshell = {
    enable = false;
    settings = {
      windows = {
        items_per_row = 5;
        switch = {
          filter_by = [ "current_workspace" ];
        };
      };
    };

    style = builtins.readFile ./style.css;
  };

  # restart hyprshell after nixos-rebuild
  home.activation.restartHyprshell = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -n "''${DBUS_SESSION_BUS_ADDRESS:-}" ]; then
      $DRY_RUN_CMD ${pkgs.systemd}/bin/systemctl --user try-restart hyprshell.service || true
    fi
  '';

}
