{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.esenciales = {
    pkgs,
    # CondicionalPortable,
    ...
  }: {
    # paquetes que no estan como opciones de NixOS
    environment.systemPackages = with pkgs; [
      vlc
      playerctl

      pulseaudio
      brightnessctl

      vesktop
      android-tools

      wl-clipboard
      cryptomator
      libreoffice
      kdiskmark
      qalculate-qt
      kicad
      unzip
      bc
      nomacs

      whatsapp-electron

      gparted
      freecad-wayland

      #NOTE: para arduino
      python314

      #NOTE: para el web scrape
      chromedriver
      geckodriver

      nautilus
    ];
    # ++ CondicionalPortable [] [jamesdsp];

    # localsend
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };

    #administrador de archivos
    programs.thunar = {
      # enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
    #NOTE: esto ayuda al automount de thunar
    services = {
      udisks2.enable = true;
      gvfs.enable = true;
      devmon.enable = true;
    };

    # eliminando todas las aplicaciones chotas de GNOME
    environment.gnome.excludePackages = with pkgs; [
      orca
      evince
      file-roller
      geary
      gnome-disk-utility
      gnome-calendar
      gnome-builder
      gnome-console
      gnome-decoder
      gnome-contacts
      gnome-calculator
      gnome-tour
      gnome-user-docs
      gnome-text-editor
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-connections
      gnome-characters
      simple-scan
      snapshot
      totem
      yelp
      gnome-software
      gnome-browser-connector
      loupe
      nautilus
      epiphany
      baobab
      seahorse
      sushi
    ];

    #eliminar xterm
    services.xserver.excludePackages = [pkgs.xterm];

    #nix ld
    # programs.nix-ld.enable = true;

    #NOTE: flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;

    #NOTE: nix-helper
    programs.nh = {
      enable = true;
      flake = "/home/ruiz/nixos";
    };
    #NOTE: ADB, android debug bridge
    # programs.adb = {
    #   enable = true;
    # };
  };
}
