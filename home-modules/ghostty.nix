{ confing, pkgs, lib, ... }:

{
	programs.ghostty = {
		enable = true;
		enableFishIntegration = true;
		installBatSyntax = true;
		settings = {
			font-family = "CaskaydiaCove Nerd Font Mono";
			font-size = 12;
			theme = "catppuccin-mocha";
			background-opacity = 0.95;
			background-blur = true; #not working
			mouse-hide-while-typing = true;
			mouse-scroll-multiplier = 0.7;
			maximize = true;
			window-padding-x = 16;
			window-padding-y = 16;
			window-padding-balance = true;
			window-decoration = "server";
		};
	};
}