{stylix, ...}: {
  stylix.targets = {
    nixvim.enable = false;
    xfce.enable = true;
    hyprland.enable = true;
    hyprland.hyprpaper.enable = true;
    waybar = {
      enable = true;
      # enableRightBackColors = true;
    };
  };
  stylix.polarity = "dark";
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
