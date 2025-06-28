{
  lib,
  pkgs,
  ...
}: {
  #NOTE: anti modo suspender
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  # paquetes que no estan como opciones de NixOS
  environment.systemPackages = with pkgs; [
    vlc
    keepassxc
    cryptomator
    libreoffice
    github-desktop
    kdiskmark
    qalculate-qt
    kicad
    unzip
    bc
    alejandra
    nomacs
    whatsie
    cava
    gparted
    arduino-ide
    neofetch
  ];

  # localsend
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  #git que es esencial
  programs.git.enable = true;

  #administrador de archivos
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };
  #NOTE: automount
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
    xterm
  ];

  #nix ld
  programs.nix-ld.enable = true;

  #NOTE: flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  #NOTE: nix-helper
  programs.nh = {
    enable = true;
    flake = "/home/portable/Documentos/GitHub/nixos/main/";
  };
}
