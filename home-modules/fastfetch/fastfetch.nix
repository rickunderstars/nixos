{ config, pkgs, lib, ... }:

{
	programs.fastfetch = {
		enable = true;

		settings = {
			logo = {
				source = "/etc/nixos/home_modules/fastfetch/nix-snowflake-rainbow.png";
				width = 30;
			};
			# logo.source = "nixos-small";
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