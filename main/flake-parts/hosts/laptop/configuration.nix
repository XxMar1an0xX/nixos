{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.configLaptop = {
    modulesPath,
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.hardwareLaptop
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

    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
