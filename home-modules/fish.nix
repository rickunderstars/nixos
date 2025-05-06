{ confing, pkgs, lib, ... }:

{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set -g fish_greeting
			fastfetch
		'';

		functions = {
			ll = "ls -alh";
			update = ''
			echo "Starting NixOS e Home Manager Update..."
			sudo nix-channel --update && sudo nixos-rebuild switch && echo "Update completed!"
			'';
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
			sudo shutdown now
			'';
			config = ''
			cd /etc/nixos
			'';
			onedrive-status = ''
			systemctl status my-onedrive.service
			'';
			onedrive-start = ''
			sudo systemctl start my-onedrive.service
			'';
			onedrive-stop = ''
			sudo systemctl stop my-onedrive.service
			'';
			onedrive-restart = ''
			sudo systemctl restart my-onedrive.service
			'';
			onedrive-log = ''
			journalctl -u my-onedrive.service -f
			'';
		};

		shellAbbrs = {
			nrs = "sudo nixos-rebuild switch --show-trace";
			cls = "clear";
		};
	};
}