{
  pkgs,
  CondicionalPortable,
  ...
}: {
  #NOTE: anti modo suspender
  systemd.targets =
    CondicionalPortable {
      sleep.enable = true;
      suspend.enable = true;
      hibernate.enable = true;
      hybrid-sleep.enable = true;
    } {
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };

  # paquetes que no estan como opciones de NixOS
  environment.systemPackages = with pkgs;
    [
      vlc
      arduino
      # arduino-cli
      arduino-ide
      # btop
      # yazi
      # discord-screenaudio #NOTE:obsoleto?
      vesktop
      android-tools

      wl-clipboard
      # keepassxc
      cryptomator
      libreoffice
      kdiskmark
      qalculate-qt
      kicad
      unzip
      bc
      nomacs
      # whatsie #NOTE: no anda ns porque

      # whatsapp-for-linux
      wasistlos
      # cava
      gparted
      # neofetch
      freecad-wayland

      rustlings
      #NOTE: para rustaceanvim
      # cargo
      # rustc
      # rustup
      # rust-analyzer

      #NOTE: para arduino
      python314

      #NOTE: para el web scrape
      chromedriver
      geckodriver

      nautilus
    ]
    ++ CondicionalPortable [] [jamesdsp];

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
  # services.xserver.excludePackages = [pkgs.xterm];

  #nix ld
  # programs.nix-ld.enable = true;

  #NOTE: flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  #NOTE: nix-helper
  programs.nh = {
    enable = true;
    flake = "/home/ruiz/nixos/main";
  };
  #NOTE: ADB, android debug bridge
  # programs.adb = {
  #   enable = true;
  # };
}
