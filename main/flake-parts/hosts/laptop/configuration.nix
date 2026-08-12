{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.configLaptop = {
    lib,
    config,
    pkgs,
    ...
  }: {
    imports = [
      # self.nixosModules.hardwareLaptop
    ];
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.NVF
    ];

    services.xserver.xkb = {
      layout = "latam";
      model = "pc104";
    };

    networking = {
      hostName = "laptop";
      networkmanager = {
        wifi.powersave = true;
        unmanaged = ["*-foo-bar"];
      };
      #NOTE: wifi
      wireless = {
        enable = true;
        userControlled.enable = true;
        dbusControlled = true;
      };
    };

    #NOTE: bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    services.blueman.enable = true;

    #NOTE: reemplazo de hardware nix
    boot = {
      initrd.availableKernelModules = ["xhci_pci" "ahci" "sd_mod" "sdhci_pci"];
      initrd.kernelModules = [];
      kernelModules = ["kvm-intel"];
      extraModulePackages = [];
    };
    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    swapDevices = [];
    # networking.interfaces.rtl8192eu.useDHCP = true;

    environment.sessionVariables = {
      HOST = "laptop";
    };
    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
