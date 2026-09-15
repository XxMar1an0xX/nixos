{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bootMenu = {
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.minegrub
    ];

    boot.loader = {
      #NOTE: si no aparece en el booteo descomentar
      # systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true; #NOTE: si falla algo en boot bien que es aqui

        double-minegrub-theme = {
          enable = true;
        };

        efiSupport = true;
        useOSProber = true;
        device = "nodev";
      };
      timeout = lib.mkForce 15;
    };
    time.hardwareClockInLocalTime = true;
  };
}
