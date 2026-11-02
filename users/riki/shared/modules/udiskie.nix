{ pkgs, ... }:

{
  services.udiskie = {
    settings = {
      program_options = {
        file_manager = "${pkgs.thunar}/bin/thunar";
      };
    };
  };
}
