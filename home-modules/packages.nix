{ config, pkgs, lib, ...}:

{
home.packages = with pkgs; [
		## cli ##
		gitflow
		bat
		broot
		ookla-speedtest
		zip
		unzip
		graphviz
		plantuml
		p7zip
		cbonsai
		pfetch
		cmatrix
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
		google-chrome
		telegram-desktop
		whatsapp-for-linux
		ente-auth
		pcloud
		gnome-logs
		gnome-music
		gnomeExtensions.blur-my-shell
		gnome-shell
		gnome-extensions-cli
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
}