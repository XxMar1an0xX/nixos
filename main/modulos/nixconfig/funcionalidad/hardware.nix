{config, ...}: {
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "sd_mod"];
  boot.extraModulePackages = [config.boot.kernelPackages.rtl8192eu]; #NOTE: esto deberia hacer andar el adaptador tplink
  #NOTE: mover a config normal
  boot.supportedFilesystems = {
    btrfs = true;
    ntfs = true;
    # zfs = lib.mkForce false;
  };
}
