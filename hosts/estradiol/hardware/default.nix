# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usbhid"
      "uas"
      "sd_mod"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/fdbae80e-5cd5-4956-83fb-9da18afe4c28";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/AA35-CFAA";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/mnt/BACKUPS" = {
      device = "/dev/disk/by-uuid/2338a52e-2388-4ae1-b4f7-116ee984b96e";
      fsType = "ext4";
    };

    "/mnt/010_wdc_1000G" = {
      device = "/dev/disk/by-uuid/82466B90466B83AF";
      fsType = "ntfs";
    };

    "/mnt/000_kingston_500G" = {
      device = "/dev/disk/by-uuid/08BE7A82BE7A6858";
      fsType = "ntfs";
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/3de49731-40bd-4fbd-90d5-959683f18c72"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp14s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp15s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
