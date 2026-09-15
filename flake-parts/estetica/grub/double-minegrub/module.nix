{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.minegrub = {
    config,
    pkgs,
    lib,
    ...
  }: let
    cfg = config.boot.loader.grub.double-minegrub-theme;
  in {
    options.boot.loader.grub.double-minegrub-theme = {
      enable = lib.mkEnableOption "the double Minegrub menu";
      mainMenuTimeout = lib.mkOption {
        type = lib.types.nullOr lib.types.ints.unsigned;
        default = 10;
        example = null;
        description = "Seconds before opening the OS menu; null waits indefinitely.";
      };
    };

    config = lib.mkIf cfg.enable {
      assertions = [
        {
          assertion = config.boot.loader.grub.enable;
          message = "double-minegrub-theme requires an existing enabled GRUB configuration.";
        }
        {
          assertion = !config.boot.loader.systemd-boot.enable;
          message = "double-minegrub-theme requires GRUB instead of systemd-boot.";
        }
      ];
      boot.loader.grub = {
        theme =
          self.packages.${pkgs.stdenv.hostPlatform.system}.double-minegrub;
        # {
        #   mainMenuTimeout =
        #     if cfg.mainMenuTimeout == null
        #     then -1
        #     else cfg.mainMenuTimeout;
        # };

        timeoutStyle = "menu";
        gfxmodeEfi = lib.mkDefault "auto";
        gfxmodeBios = lib.mkDefault "auto";
        extraConfig = lib.mkAfter (builtins.readFile ./../../../../recursos/minegrub/redirect.cfg);
      };
    };
  };
}
