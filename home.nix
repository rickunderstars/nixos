{ config, pkgs, ... }:

{
	home.username = "riki";
	home.homeDirectory = "/home/riki";

	home.packages = with pkgs; [
		## cli ##
		fastfetch
		ookla-speedtest
		zip
		unzip
		oh-my-posh
		graphviz
		plantuml
		## programming languages ##
		go
		gcc
		gnumake
		gdb
		cmake
		gradle
		openjdk
		python3
		rustc
		cargo
		vscodium
		ghostty
		google-chrome
		telegram-desktop
		whatsapp-for-linux
		ente-auth
		pcloud
		# cura
		anki
		arduino
		discord
		godot_4
		itch
		meshlab
		wings
		mpv
		spotify
		obsidian
		obs-studio
		onlyoffice-desktopeditors
		zathura
		stremio
		p7zip
		## other ##
		nerdfonts
	];

	# Tool config model
#	home.xdg.configFile."<tool-name>/config.toml" = {
#	source = ./dotfiles/config.toml;
#	};

	# Scripts model
#	home.file.".local/bin/<script-name>"
#	source = ./scripts/<script-name>.sh;
#	executable = true;
#	};

	# Env variables
	home.sessionVariables = {
	};

	# Fish
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set -g fish_greeting # Hides fish greeting
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
		};

		shellAbbrs = {
			nrs = "sudo nixos-rebuild switch --show-trace";
			cls = "clear";
		};
	};




	home.stateVersion = "24.11";
#home-manager.users.riki = {
#	home.stateVersion = "24.11";
#	programs.onedrive = {
#	enable = true;
#	settings = {
#	sync_dir = "~/OneDrive";
#	};
#};
#};
}