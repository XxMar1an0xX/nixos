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
      self.nixosModules.limpieza
      {
        environment.systemPackages = [
          self.packages."x86_64-linux".NVF
          # self.packages."x86_64-linux".arduino
        ];
        fonts.packages = [];
      }
    ];
  };
}
