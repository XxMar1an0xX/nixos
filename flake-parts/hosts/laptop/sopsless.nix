{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.laptopNoSops = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.configLaptop
      self.nixosModules.bootMenu
      self.nixosModules.SDDM
      # self.nixosModules.stylix
      # self.nixosModules.juegos
      self.nixosModules.hardwareTweaks
      self.nixosModules.esenciales
      self.nixosModules.limpieza
      # self.nixosModules.winapps
      # self.nixosModules.sops
      self.nixosModules.commonconfig
      # self.nixosModules.invidious
      self.diskoConfigurations.laptop
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l480
    ];
  };
}
