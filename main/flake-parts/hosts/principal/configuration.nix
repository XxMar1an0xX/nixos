# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.configPrincipal = {
    modulesPath,
    # inputs,
    # self,
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.hardwarePrincipal
    ];

    environment.systemPackages = [
      self.packages."${pkgs.stdenv.hostPlatform.system}".NVF
    ];

    #NOTE: Video driverspara gpu
    services.xserver.videoDrivers = ["amdgpu"];
    services.xserver.xkb = {
      layout = "latam";
      # variant = "";
      model = "microsoftinet";
    };

    #NOTE: anti modo suspender
    systemd.targets = {
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };

    hardware.amdgpu = {
      opencl.enable = true;
      initrd.enable = true;
      overdrive.enable = true;
    };

    environment.sessionVariables = {
      HOST = "nixos";
    };

    #NOTE: hardware.nix replacement
    boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "uas" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    networking.hostName = "nixos";

    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
