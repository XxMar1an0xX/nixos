{
  self,
  inputs,
  ...
}: {
  flake.homeModules.stylix = {config, ...}: {
    imports = [inputs.stylix.homeModules.default];
    stylix.targets = {
      btop.enable = false;
      nixvim.enable = false;
      nvf.enable = false;
      xfce.enable = false;
      hyprland.enable = true;
      hyprland.hyprpaper.enable = true;
      rofi.enable = false;
      gtk.enable = false;
      kitty = {
        enable = false;
        colors = {
          enable = false;
          override = false;
        };
        # inputs = {
        #   enable = false;
        #   override = false;
        # };
        # opacity = {enable = false;};
        # variant256Colors = true;
      };
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
      firefox.enable = false;
      librewolf.enable = false;
      librewolf.profileNames = ["ruiz"];
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
  };
}
