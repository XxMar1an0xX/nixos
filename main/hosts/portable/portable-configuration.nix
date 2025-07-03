{
  pkgs,
  modulesPath,
  inputs,
  config,
  ...
}: let
  custom = config.custom.HacerPortable;
in {
  #NOTE: aqui van los modulos .nix
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"

    #NOTE: comando para hacer ISO:
    # nix run nixpkgs#nixos-generators -- --format iso --flake /home/ruiz/Documentos/GitHub/nixos/main#portable -o result
    ./../../hosts/principal/configuration.nix

    ./../../modulos/portabilizacion/nixconfig.nix
    # ./../../modulos/portabilizacion/nixconfig.nix
  ];

  custom.HacerPortable = true;

  # #NOTE: config inicial del home-manager
  #   home-manager = {
  #     users = {
  #       "Ruiz" = import ./home-portable.nix;
  #     };
  #     extraSpecialArgs = {inherit inputs;};
  #   };

  networking.wireless = {
    # Enables wireless support via wpa_supplicant.
    enable = true;
    userControlled.enable = true;
    dbusControlled = true;
  };

  #NOTE: aqui solucion del problema de network manager
  networking = {
    #   hostName = "nixos";
    networkmanager = {
      wifi.powersave = true;
      #     enable = true;
      unmanaged = ["*-foo-bar"];
    };
  };

  services.gnome3.gnome-keyring.enable = true;
  #NOTE: habilitar GNOME
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  #NOTE: habilitar sonido
  # services.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  #NOTE: idioma
  # time.timeZone = "America/Argentina/Tucuman";

  # Select internationalisation properties.
  # i18n.defaultLocale = "es_AR.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "es_AR.UTF-8";
  #   LC_IDENTIFICATION = "es_AR.UTF-8";
  #   LC_MEASUREMENT = "es_AR.UTF-8";
  #   LC_MONETARY = "es_AR.UTF-8";
  #   LC_NAME = "es_AR.UTF-8";
  #   LC_NUMERIC = "es_AR.UTF-8";
  #   LC_PAPER = "es_AR.UTF-8";
  #   LC_TELEPHONE = "es_AR.UTF-8";
  #   LC_TIME = "es_AR.UTF-8";
  # };
  # console.keyMap = "la-latin1";

  #NOTE: xserve
  # services.xserver.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
}
