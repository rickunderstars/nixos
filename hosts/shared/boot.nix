{
  pkgs,
  ...
}:

{

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
      theme = ../../assets/grub/bsol;
    };
  };

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
    "btrfs"
    "ext4"
  ];
}
