{
  pkgs,
  modulesPath,
  inputs,
  ...
}:{
#NOTE: aqui van los modulos .nix
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    inputs.home-manager.nixosModules.default
    ./modulos/usuario-ruiz.nix
    ./modulos/Estetica/stylix.nix
    ./modulos/programas_esenciales.nix
    ];


#NOTE: config inicial del home-manager
  home-manager = {
    users = {
      "Ruiz" = import ./home-portable.nix;
    };
    extraSpecialArgs = {inherit inputs;};
  };

#NOTE: aqui solucion del problema de network manager
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      unmanaged = ["*-foo-bar"];
    };
  };

#NOTE: habilitar GNOME 
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

#NOTE: habilitar sonido
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

#NOTE: idioma
  time.timeZone = "America/Argentina/Tucuman";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_AR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };
  console.keyMap = "la-latin1";

#NOTE: xserve
  services.xserver.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
  }
