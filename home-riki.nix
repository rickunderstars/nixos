{ config, pkgs, lib,... }:

{
	home.username = "riki";
	home.homeDirectory = "/home/riki";
	home.stateVersion = "24.11";

	imports = [
		./home-modules/mimeapps.nix
		./home-modules/packages.nix
		./home-modules/fastfetch/fastfetch.nix
		./home-modules/fish.nix
		./home-modules/oh-my-posh/oh-my-posh.nix
		./home-modules/ghostty.nix
		./home-modules/btop.nix
		./home-modules/git.nix
		./home-modules/broot/broot.nix
	];

	# env variables
	home.sessionVariables = {
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



}