{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "image/jpeg" = [ "imv.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "image/bmp" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/tiff" = [ "imv.desktop" ];
      "image/svg+xml" = [ "imv.desktop" ];
      "image/heif" = [ "imv.desktop" ];
      "image/heic" = [ "imv.desktop" ];
      "image/avif" = [ "imv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/ogg" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];
      "audio/wav" = [ "mpv.desktop" ];
      "audio/aac" = [ "mpv.desktop" ];
      "audio/opus" = [ "mpv.desktop" ];
      "audio/x-m4a" = [ "mpv.desktop" ];
      "audio/x-musepack" = [ "mpv.desktop" ];
      "text/plain" = [ "codium.desktop" ];
      "text/x-go" = [ "codium.desktop" ];
      "text/x-csrc" = [ "codium.desktop" ];
      "text/x-chdr" = [ "codium.desktop" ];
      "text/x-c++src" = [ "codium.desktop" ];
      "text/x-java-source" = [ "codium.desktop" ];
      "text/x-python" = [ "codium.desktop" ];
      "text/rust" = [ "codium.desktop" ];
      "text/markdown" = [ "codium.desktop" ];
      "application/json" = [ "codium.desktop" ];
      "application/yaml" = [ "codium.desktop" ];
      "application/toml" = [ "codium.desktop" ];
      "application/xml" = [ "codium.desktop" ];
      "text/x-shellscript" = [ "codium.desktop" ];
      "text/css" = [ "codium.desktop" ];
      "application/javascript" = [ "codium.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      "text/x-arduino" = [ "arduino-arduinoide.desktop" ];
      "application/pdf" = [ "qpdfview.desktop" ];
      "model/stl" = [ "meshlab.desktop" ];
      "model/obj" = [ "meshlab.desktop" ];
    };

    associations.added = {
      "application/pdf" = [ "firefox.desktop" ];
    };
  };
}
