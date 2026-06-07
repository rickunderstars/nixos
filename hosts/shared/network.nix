{ ... }:

{
  networking = {
    networkmanager.enable = false;
    wireless.enable = false;
    wireless.iwd = {
      enable = true;
      settings = {
        Network = {
          EnableIPv6 = true;
          EnableNetworkConfiguration = false;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };

    dhcpcd = {
      enable = true;
      wait = "background";
      extraConfig = ''
        nocarrier_roaming
        timeout 10
      '';
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 5353 7000 7001 7100 ];
      allowedUDPPorts = [ 53317 5353 6000 6001 7011 ];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    nssmdns6 = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      hinfo = true;
      userServices = true;
    };
  };
}
