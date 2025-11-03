{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{

  services.hyprshell = {
    enable = true;
    settings = {
      windows = {
        items_per_row = 5;
        overview = {
          launcher = {
            default_terminal = "ghostty";
            plugins = {
              applications = {
                run_cache_weeks = 1;
                show_execs = true;
                show_actions_submenu = true;
              };
              calc = { };
            };
          };
          hide_filtered = false;
        };
        switch = {
          filter_by = [ "current_monitor" ];
        };
      };
    };

    systemd = {
      enable = true;
      args = "-vv";
    };

    style = builtins.readFile ../../../assets/hyprshell/style.css;
  };

  # restart hyprshell after nixos-rebuild
  home.activation.restartHyprshell = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.systemd}/bin/systemctl --user restart hyprshell.service
  '';

}
