{stylix, ...}: {
  stylix.targets = {
    nixvim.enable = false;
    xfce.enable = true;
    hyprland.enable = true;
    hyprland.hyprpaper.enable = false;
  };
  stylix.polarity = "dark";
  #NOTE: configuracion para gnome default dark
  # gtk = {
  #   enable = true;
  #   gtk3.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  #   gtk4.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  # };
}
