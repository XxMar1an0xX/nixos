{
  self,
  inputs,
  ...
}: {
  flake.homeModules.homeprincipal = {
    imports = [
      self.homeModules.fastfetch
      self.homeModules.firefox
      self.homeModules.github
      self.homeModules.hyprland
      self.homeModules.kitty
      self.homeModules.winapps
      # self.homeModules.rofi
      self.homeModules.syncthing
      self.homeModules.waybar
      self.homeModules.config-cortas
      self.homeModules.aliases
      self.homeModules.commonHome

      #TODO: parece que stylix no funciona con este tipo de config
      # self.homeModules.stylix
    ];
  };
}
