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
            if uwsm check may-start
            	exec uwsm start hyprland-uwsm.desktop
            end
      			set -g fish_greeting
      			if command -q nix-your-shell
      				nix-your-shell fish | source
      			end
      			if not set -q IN_NIX_SHELL
      				fastfetch
      			end
      		'';
    functions = {
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

      # screenshots
      screenshot-full = ''
        set SCREENSHOT_DIR "$HOME/Pictures/Screenshots"
        mkdir -p $SCREENSHOT_DIR
        set FILENAME  (date +%Y-%m-%d_%Hh%Mm%Ss)"_full.png"
        set FILEPATH "$SCREENSHOT_DIR/$FILENAME"
        grim - | tee $FILEPATH | wl-copy
      '';
      screenshot-region = ''
        set SCREENSHOT_DIR "$HOME/Pictures/Screenshots"
        mkdir -p $SCREENSHOT_DIR
        set FILENAME  (date +%Y-%m-%d_%Hh%Mm%Ss)"_reg.png"
        set FILEPATH "$SCREENSHOT_DIR/$FILENAME"
        grim -g (slurp) - | tee $FILEPATH | wl-copy
      '';

      # ls
      l = "eza -lah";
      ls = "eza";
      tree = "eza --tree --git-ignore";

      # nixos
      config = "cd ~/nixos-config";
      nixos-clean = "sudo nix-collect-garbage -d --delete-older-than 14d; sudo nix-store --optimise";

      # set volume (0-100)
      vol = ''
        if test (count $argv) -ne 1
        echo "Usage: volume <volume(0-100)>"
        return 1
        end

        set -l volume $argv[1]

        if not string match -qr '^(100|[1-9]?[0-9])$' -- $volume
        echo "Error: volume must be between 0 and 100"
        return 1
        end

        set -l percent (math "$volume / 100")

        wpctl set-volume @DEFAULT_AUDIO_SINK@ $percent
      '';

      mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 1";
      unmute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0";

      # misc
      cls = "clear";
      ff = "clear;fastfetch";
      py = "python";
      auch = "python ~/nixos-config/users/riki/shared/term/fish/audio-switch.py";
      here = "pwd | wl-copy; pwd";
      home = "cd ~";
      goodnight = "shutdown now";
    };

    shellAbbrs = {
      # utilities
      cat = "bat";
      top = "btop";
      man = "batman";

      # try a package
      try = "nix-shell -p";

      # shells
      gopxl = "nix develop ~/nixos-config#gopxlDev";
      stat = "nix develop ~/nixos-config#statDev";
      heart = "nix develop ~/nixos-config#heartDev";
    };
  };
}
