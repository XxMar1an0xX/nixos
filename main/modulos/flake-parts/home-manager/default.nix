{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.homeManager = {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.homeconfigPrincipal
      # inputs.stylix.nixosModules.stylix
    ];
    home-manager.users."ruiz".imports = [
      self.homeModules.fastfetch
      self.homeModules.firefox
      self.homeModules.github
      self.homeModules.hyprland
      self.homeModules.kitty
      # self.homeModules.rofi
      self.homeModules.syncthing
      self.homeModules.waybar
      self.homeModules.config-cortas
      self.homeModules.aliases

      #TODO: parece que stylix no funciona con este tipo de config
      # self.homeModules.stylix

      # # ./../../elnixvim/nixvim.nix
      # ./../../modulos/home-manager/stylix-hm.nix
      # ./../../modulos/home-manager/funcionalidad/firefox.nix
      # ./../../modulos/home-manager/funcionalidad/syncthing.nix
      #
      # # ./../../modulos/portabilizacion/home-manager.nix
      #
      # ./../../modulos/home-manager/rofi.nix
      #
      # # ./modulos/gnome_personalizacion.nix
      # ./../../modulos/home-manager/funcionalidad/hyperland.nix
      # ./../../modulos/home-manager/funcionalidad/waybar.nix
      #
      # ./../../modulos/home-manager/github.nix
      # ./../../modulos/home-manager/terminal.nix
      # ./../../modulos/home-manager/config-cortas.nix
      # ./../../modulos/home-manager/fastfetch.nix
      #
      # ./../../modulos/home-manager/arduino-cli.nix
    ];
  };
}
