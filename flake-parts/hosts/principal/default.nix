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
      self.nixosModules.caddy
      self.nixosModules.vikunja
      #NOTE: no estoy logrando hacer andar rustdesk en wayland
      #Sway tampoco anda, hyprland no comprobado
      # self.nixosModules.rustdesk
      # self.nixosModules.rustdesk-server
      self.nixosModules.waydroid
      self.diskoConfigurations.nixos
    ];
    specialArgs = {
      isLaptop = false;
    };
  };
}
