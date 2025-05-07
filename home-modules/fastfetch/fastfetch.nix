{ config, pkgs, lib, ... }:

let
	logo-src = /etc/nixos/home-modules/fastfetch/logo.png;
	logo-options =
	if	builtins.pathExists logo-src
	then { source = logo-src; width = 30; }
	else { source = "nixos-small"; };
	custom-separator = {type = "custom"; key = ">----------<+>-----------------------------<";};
in
{
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = logo-options;
			display.separator = "";
			display.key.width = 16;
			modules = [
				{
					type = "title";
				}
				custom-separator
				{
					type = "os";
					key = "  os  ";
					keyColor = "italic_green";
				}
				{
					type = "host";
					key = "  host  ";
					keyColor = "italic_green";
				}
				{
					type = "kernel";
					key = "  kernel  ";
					keyColor = "italic_green";
				}
				{
					type = "bootmgr";
					key = "  boot  ";
					keyColor = "italic_green";
				}
				{
					type = "uptime";
					key = "  uptime  ";
					keyColor = "italic_green";
				}
				custom-separator
				{
					type = "shell";
					key = "  shell  ";
					keyColor = "italic_cyan";
				}
				{
					type = "terminal";
					key = "  terminal  ";
					keyColor = "italic_cyan";
				}
				{
					type = "packages";
					key = "  pkgs  ";
					keyColor = "italic_cyan";
				}
				{
					type = "wm";
					key = "  wm  ";
					keyColor = "italic_cyan";
				}
				{
					type = "lm";
					key = "  login  ";
					keyColor = "italic_cyan";
				}
				custom-separator
				{
					type = "cpu";
					key = "  cpu  ";
					keyColor = "italic_blue";
				}
				{
					type = "gpu";
					key = "  gpu  ";
					keyColor = "italic_blue";
				}
				{
					type = "memory";
					key = "  memory  ";
					keyColor = "italic_blue";
				}
				{
					type = "disk";
					key = "  ssd  ";
					keyColor = "italic_blue";
				}
				{
					type = "display";
					key = "  display  ";
					keyColor = "italic_blue";
				}
				custom-separator
			];
		};
	};
}