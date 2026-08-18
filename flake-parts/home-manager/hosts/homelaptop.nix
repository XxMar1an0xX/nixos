{
  self,
  inputs,
  self',
  ...
}: {
  flake.homeModules.homelaptop = {lib, ...}: {
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
      {
        programs.firefox.profiles.ruiz.search.default = lib.mkForce "Startpage";
      }
    ];
  };
}
