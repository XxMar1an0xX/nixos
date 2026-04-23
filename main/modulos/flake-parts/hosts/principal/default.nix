{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.configPrincipal
      self.nixosModules.bootMenu
      self.nixosModules.homeManager
      self.nixosModules.SDDM
      self.nixosModules.stylix
      self.nixosModules.juegos
      self.nixosModules.hardwareTweaks
      self.nixosModules.esenciales
      {
        environment.systemPackages = [
          self.packages."x86_64-linux".NVF
        ];
      }
    ];
  };
}
