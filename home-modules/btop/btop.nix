{ confing, pkgs, lib, ... }:

{
	programs.btop = {
		enable = true;
		settings = {
			theme_background = false;
			rounded_corners = true;
			graph_symbol = "braille";
			update_ms = 500;
			color_theme = "catppuccin_mocha";
		};

	};
	home.file.".config/btop/themes/catppuccin_mocha.theme" = {
		source = /etc/nixos/home-modules/btop/catppuccin_mocha.theme;
	};
}