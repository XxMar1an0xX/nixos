{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.limpieza = {config, ...}: {
    system.autoUpgrade = {
      enable = true;
      dates = "weekly";
    };
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "monthly";
      options = "-d";
    };
  };
}
