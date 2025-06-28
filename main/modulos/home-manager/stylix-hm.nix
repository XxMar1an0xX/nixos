{
  stylix,
  lib,
  ...
}: {
  stylix.targets = {
    nixvim.enable = false;
    xfce.enable = true;
    hyprland.enable = true;
    hyprland.hyprpaper.enable = true;
    cava = {
      enable = true;

      # rainbow = true;
    };

    waybar = {
      # enable = true;
      enable = true;
      # background = lib.mkDefault "@base00";

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
