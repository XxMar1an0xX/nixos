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

    networking.hostName = config.system.nixos.distroId;

    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
