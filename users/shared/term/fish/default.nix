{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      			set -g fish_greeting
      			if command -q nix-your-shell
      				nix-your-shell fish | source
      			end
      			if not set -q IN_NIX_SHELL
      				fastfetch
      			end
      		'';
    functions = {
      ll = "ls -alh";
      br = ''
        			set -l cmd_file (mktemp)
        			if broot --outcmd $cmd_file $argv
        			source $cmd_file
        			rm -f $cmd_file
        			else
        			set -l code $status
        			rm -f $cmd_file
        			return $code
        			end
        			'';
      home = ''
        			cd ~
        			'';
      goodnight = ''
        			shutdown now
        			'';
      config = ''
        			cd ~/nixos-config
        			'';
      onedrive-status = ''
        			systemctl --user status onedrive.service
        			'';
      onedrive-start = ''
        			systemctl --user start onedrive.service
        			'';
      onedrive-stop = ''
        			systemctl --user stop onedrive.service
        			'';
      onedrive-restart = ''
        			systemctl --user restart onedrive.service
        			'';
      onedrive-log = ''
        			journalctl --user -u onedrive.service -f
        			'';
    };

    shellAbbrs = {
      try = "nix-shell -p";
      cls = "clear";
      ff = "clear;fastfetch";
      here = "pwd | wl-copy; pwd";

      # shells
      gopxl = "nix develop ~/nixos-config#gopxlDev";
      stat = "nix develop ~/nixos-config#statDev";
    };
  };
}
