{ config, pkgs, ... }:

{
	home.username = "riki";
	home.homeDirectory = "/home/riki";

	home.packages = with pkgs; [
		## cli ##
		ookla-speedtest
		zip
		unzip
		oh-my-posh
		graphviz
		plantuml
		p7zip
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
		## gui ##
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
		qpdfview
		stremio
		ark # p7zip frontend
		## other ##
		nerdfonts
	];

	programs.fastfetch = {
		enable = true;

		settings = {
			logo.source = "nixos-small";
			display.separator = "~>	";
			display.key.width = 22;
			modules = [
				"Title"
				"Separator"
				{ type = "os";					key = "💻 OS            "; }
				{ type = "host";				key = "🏠 Host          "; }
				{ type = "kernel";				key = "🐧 Kernel        "; }
				{ type = "uptime";				key = "⏱️ Uptime        "; }
				{ type = "bios";				key = "💾 Bios          "; }
				{ type = "bootmgr";				key = "🚀 Bootmgr       "; }
				"Separator"
				{ type = "packages";			key = "📦 Packages      "; }
				{ type = "shell";				key = "🐚 Shell         "; }
				{ type = "display";				key = "🖼️ Display       "; }
				{ type = "de";					key = "✨ DE            "; }
				{ type = "theme";				key = "🎨 Theme         "; }
				{ type = "wm";					key = "🔲 WM            "; }
				{ type = "wmtheme";				key = "🎨 WM Theme      "; }
				{ type = "lm";					key = "🔑 LM            "; }
				{ type = "icons";				key = "👍 Icons         "; }
				{ type = "font";				key = "✒️ Font          "; }
				{ type = "cursor";				key = "👉 Cursor        "; }
				{ type = "terminal";			key = ">_ Terminal      "; }
				{ type = "terminalfont";		key = "✒️ Terminal Font "; }
				"Separator"
				{ type = "cpu";					key = "⚙️ CPU           "; }
				{ type = "gpu";					key = "🎮 GPU           "; }
				{ type = "memory";				key = "🐏 Memory        "; }
				{ type = "swap";				key = "🔄 Swap          "; }
				{ type = "disk";				key = "💾 Disk          "; }
				{ type = "battery";				key = "🔋 Battery       "; }
				"Break"
				"Colors"
			];
		};
	};

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
			goodnight = ''
			sudo shutdown now
			'';
		};

		shellAbbrs = {
			nrs = "sudo nixos-rebuild switch --show-trace";
			cls = "clear";
		};
	};

	xdg.mimeApps = {
		enable = true;

		defaultApplications = {
			"video/x-matroska" = [ "mpv.desktop" ];
			"video/mp4"        = [ "mpv.desktop" ];
			"text/plain"             = [ "codium.desktop" ];
			"text/x-go"              = [ "codium.desktop" ];
			"text/x-csrc"            = [ "codium.desktop" ];
			"text/x-chdr"            = [ "codium.desktop" ];
			"text/x-c++src"          = [ "codium.desktop" ];
			"text/x-java-source"     = [ "codium.desktop" ];
			"text/x-python"          = [ "codium.desktop" ];
			"text/rust"              = [ "codium.desktop" ];
			"text/html"              = [ "google-chrome.desktop" ];
			"application/xhtml+xml"  = [ "google-chrome.desktop" ];
			"x-scheme-handler/http"  = [ "google-chrome.desktop" ];
			"x-scheme-handler/https" = [ "google-chrome.desktop" ];
			"x-scheme-handler/about" = [ "google-chrome.desktop" ];
			"x-scheme-handler/unknown" = [ "google-chrome.desktop" ];
			"text/x-arduino"         = [ "arduino-arduinoide.desktop" ];
			"application/zip"        = [ "ark.desktop" ];
			"application/pdf"        = [ "qpdfview.desktop" ];
			"model/stl"              = [ "meshlab.desktop" ];
			"model/obj"              = [ "meshlab.desktop" ];
			"x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
			"x-scheme-handler/tonsite" = [ "org.telegram.desktop.desktop" ];
		};

		associations.added = {
			"application/pdf" = [ "google-chrome.desktop" ];
		};
	};

	# Tool config model
#	home.xdg.configFile."<tool-name>/config.toml" = {
#	source = ./dotfiles/config.toml;
#	};

	# Scripts model
#	home.file.".local/bin/<script-name>"
#	source = ./scripts/<script-name>.sh;
#	executable = true;
#	};


	home.stateVersion = "24.11";
}