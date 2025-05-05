{ config, pkgs, lib,... }:

{
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
}