{ ... }:

{
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        53317
        5353
        7000
        7001
        7100
      ];
      allowedUDPPorts = [
        53317
        5353
        6000
        6001
        7011
      ];
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
