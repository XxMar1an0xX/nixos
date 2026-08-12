{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.configPrincipal
      self.nixosModules.bootMenu
      self.nixosModules.SDDM
      self.nixosModules.stylix
      self.nixosModules.juegos
      self.nixosModules.hardwareTweaks
      self.nixosModules.esenciales
      self.nixosModules.limpieza
      self.nixosModules.winapps
      self.nixosModules.sops
      self.nixosModules.commonconfig
      self.nixosModules.invidious
      self.nixosModules.searxng
    ];
  };
}
