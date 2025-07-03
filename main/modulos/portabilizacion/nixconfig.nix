{
  lib,
  pgks,
  modulesPath,
  config,
  ...
}:
with lib; {
  #NOTE: opcion hacerportable custom
  options = {
    custom.HacerPortable = mkOption {
      type = types.bool;
      default = false;
      example = true;
    };
  };

  config = mkIf config.custom.HacerPortable {
    # mkIf = custom.HacerPortable
    #teclado generico
    services.xserver.xkb = mkForce {
      layout = "latam";
      variant = "";
      model = "";
    };

    #NOTE: quitar anti modo suspender
    systemd.targets = mkForce {
      sleep.enable = true;
      suspend.enable = true;
      hibernate.enable = true;
      hybrid-sleep.enable = true;
    };

    #NOTE: grub
    boot.loader.grub = mkForce {
      gfxmodeEfi = "";
      gfxmodeBios = "";
    };
  };
}
