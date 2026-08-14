{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.limpieza = {
    config,
    pkgs,
    ...
  }: {
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
    # system.userActivationScripts = {
    #   arduinoRoute = {
    #     text =
    #       /*
    #       bash
    #       */
    #       ''
    #         echo ${builtins.getAttr "userPath" self.packages."x86_64-linux".arduino}
    #       '';
    #   };
    # };
  };
}
