{ confing, pkgs, lib, ... }:

{
	programs.oh-my-posh = {
		enable = true;
		enableFishIntegration = true;
		useTheme = "di4am0nd";
	};
}