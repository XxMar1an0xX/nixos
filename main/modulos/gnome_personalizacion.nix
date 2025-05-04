{
  lib,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    # theme = {
    #   name = "Everforest-Dark-BL-LB";
    #   package = pkgs.everforest-gtk-theme;
    # };
    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };
    # theme = {
    #   name = "dark";
    #   package = pkgs.graphite-gtk-theme;
    # };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "palenight";

  home.packages = with pkgs; [
    gnome-themes-extra
    sassc
    gtk-engine-murrine
  ];
}
