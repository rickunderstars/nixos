{ confing, pkgs, lib, ... }:

let
	my-theme = /etc/nixos/home-modules/oh-my-posh/theme.omp.json;
	path-exists = builtins.pathExists my-theme;
in
{
	programs.oh-my-posh = {
		enable = true;
		enableFishIntegration = true;

	} // (
		if path-exists then {
			settings = builtins.fromJSON (builtins.readFile my-theme);
		} else {
			theme = "di4am0nd";
		}
	);
}