{ config, pkgs, lib, ... }:

let
	logo-src = /etc/nixos/home-modules/fastfetch/logo.png;
	logo-options =
	if	builtins.pathExists logo-src
	then { source = logo-src; width = 30; }
	else { source = "nixos-small"; };
in
{
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = logo-options;
			display.separator = "~>	";
			display.key.width = 22;
			modules = [
				"Title"
				"Separator"
				{
					type = "os";
					key = " os            ";
				}
				{
					type = "host";
					key = " Host          ";
				}
				{
					type = "kernel";
					key = "󰌽 Kernel        ";
				}
				{
					type = "uptime";
					key = " Uptime        ";
				}
				{
					type = "bios";
					key = " Bios          ";
				}
				{
					type = "bootmgr";
					key = " Bootmgr       ";
				}
				"Separator"
				{
					type = "packages";
					key = " Packages      ";
				}
				{
					type = "shell";
					key = " Shell         ";
				}
				{
					type = "display";
					key = "󰍹 Display       ";
				}
				{
					type = "de";
					key = "󰧨 DE            ";
				}
				{
					type = "theme";
					key = "󰏘 Theme         ";
				}
				{
					type = "wm";
					key = " WM            ";
				}
				{
					type = "wmtheme";
					key = " WM Theme      ";
				}
				{
					type = "lm";
					key = " LM            ";
				}
				{
					type = "icons";
					key = "󰬐 Icons         ";
				}
				{
					type = "font";
					key = "󰴓 Font          ";
				}
				{
					type = "cursor";
					key = "󰇀 Cursor        ";
				}
				{
					type = "terminal";
					key = " Terminal      ";
				}
				{
					type = "terminalfont";
					key = "󰴓 Terminal Font ";
				}
				"Separator"
				{
					type = "cpu";
					key = "󰻠 CPU           ";
				}
				{
					type = "gpu";
					key = " GPU           ";
				}
				{
					type = "memory";
					key = " Memory        ";
				}
				{
					type = "swap";
					key = "󰯍 Swap          ";
				}
				{
					type = "disk";
					key = "󰉉 Disk          ";
				}
				{
					type = "battery";
					key = "󱊣 Battery       ";
				}
				"Break"
				"Colors"
			];
		};
	};
}