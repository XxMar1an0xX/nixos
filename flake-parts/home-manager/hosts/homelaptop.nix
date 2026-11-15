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
      # self.homeModules.hyprland
      self.homeModules.kitty
      self.homeModules.winapps
      # self.homeModules.rofi
      self.homeModules.syncthing
      self.homeModules.waybar
      self.homeModules.config-cortas
      self.homeModules.aliases
      self.homeModules.commonHome
      self.homeModules.minecraft
      self.homeModules.noctalia
      {
        programs.firefox.profiles.ruiz.search.default = lib.mkForce "Startpage";

        services.syncthing = {
          cert = lib.mkForce "/var/lib/syncthing/laptop/cert.pem";
          key = lib.mkForce "/var/lib/syncthing/laptop/key.pem";
        };

        programs.noctalia.settings.desktop_widgets = lib.mkForce {
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = false;
          };
          schema_version = 2;
          widget = {
            desktop-widget-0000000000000001 = {
              box_height = 169.328;
              box_width = 1499.3;
              cx = 769.136;
              cy = 587.564;
              output = "eDP-1";
              placement_height = 864;
              placement_width = 1536;
              rotation = -0.039536;
              settings = {
                background = false;
                bands = 32;
                centered = false;
                mirrored = true;
                reversed = false;
                show_when_idle = true;
              };
              type = "audio_visualizer";
            };
          };
          widget_order = ["desktop-widget-0000000000000001"];
        };
      }
    ];
  };
}
