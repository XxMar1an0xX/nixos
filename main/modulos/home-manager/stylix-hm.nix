{stylix, ...}: {
  stylix.targets.nixvim.enable = false;
  #NOTE: configuracion para gnome default dark
  gtk = {
    enable = true;
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
}
