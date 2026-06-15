{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.configLaptop
      self.nixosModules.bootMenu
      self.nixosModules.homeManager
      self.nixosModules.SDDM
      self.nixosModules.stylix
      self.nixosModules.juegos
      self.nixosModules.hardwareTweaks
      self.nixosModules.esenciales
      self.nixosModules.limpieza
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l480
    ];
  };
}
