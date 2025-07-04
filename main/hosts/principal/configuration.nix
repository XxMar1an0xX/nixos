# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    #NOTE: funcionalidad
    ./../../modulos/nixconfig/funcionalidad/invidious.nix
    ./../../modulos/nixconfig/funcionalidad/VMs.nix
    ./../../modulos/nixconfig/funcionalidad/juegos.nix
    # Include the results of the hardware scan.
    #NOTE: default
    ./../../modulos/nixconfig/defaults/programas_esenciales.nix
    ./../../modulos/nixconfig/defaults/limpieza_y_actualizacion.nix
    ./../../modulos/nixconfig/defaults/usuario-portable.nix
    #NOTE: Estetica
    ./../../modulos/nixconfig/Estetica/stylix.nix
    ./../../modulos/nixconfig/Estetica/SDDM-login.nix
    ./../../modulos/nixconfig/Estetica/grub.nix
    #NOTE: misceallaneo
    ./../../modulos/nixconfig/misc/nixai.nix
    ./../../modulos/nixconfig/misc/ollama.nix

    ./../../hardware-configuration.nix #esto es necesario para q ande

    #NOTE: ver forma de quitar esto haciendo que custom sea o la deficion normal, o falso si esta no existe
    ./../../modulos/portabilizacion/nixconfig.nix
  ];
  home-manager = let
    custom = config.custom.HacerPortable;
  in {
    extraSpecialArgs = {
      inherit inputs;
      inherit custom;
    };
    users = {
      "ruiz" = import ./home.nix;
    };

    # sharedModules = [

    #   {
    #     # stylix.targets.kitty.enable = false;
    #     stylix.targets.neovim.enable = false;
    #   }
    # ];

    # backupFileExtension = "kjasdksaj";
    #de-comentar si se rompe home-manager
  };

  networking.hostName = "nixos"; # Define your hostname.
  qt.enable = true;
  hardware.graphics.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.

  #NOTE: teclado (hacerlo modulo custom)
  services.xserver.xkb = {
    layout = "latam";
    # variant = "";
    model = "microsoftinet";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  boot.initrd.systemd.dbus.enable = true;
  services.dbus.enable = true;
  services.passSecretService = {
    enable = true;
    package = pkgs.pass-secret-service;
  };
  services.dbus.packages = with pkgs; [
    pass-secret-service
  ];
  #
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ruiz = {
    isNormalUser = true;
    description = "ruiz";
    extraGroups = ["networkmanager" "wheel"];
    hashedPassword = "$y$j9T$130s2ATsRL5ixDudKitBG/$bqE8TWji9UmfWrZgX/791zqONEFPu7ivzPS/PmjN0j7";
    packages = with pkgs; [
      #  thunderbird
    ];
  };
  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget

    # pass-secret-service
    # rust-analyzer
    # rustc
    # rustup
    # cargo
    hyprpolkitagent
  ];

  #NOTE: Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;

  #NOTE: script al inicio de login
  systemd.user.services.autoinicio = {
    description = "autoinicio al loguearse";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
      hyprland
    '';
    wantedBy = ["multi-user.target"]; # starts after login
  };
  # security.polkit = {
  #   enable = true;
  # };

  fonts.packages = with pkgs; [
    dejavu_fonts
    # nerd-fonts._0xproto
    # nerd-fonts._3270
    # nerd-fonts.agave
    # nerd-fonts.anonymice
    # nerd-fonts.arimo
    # nerd-fonts.aurulent-sans-mono
    # nerd-fonts.bigblue-terminal
    # nerd-fonts.bitstream-vera-sans-mono
    # nerd-fonts.blex-mono
    # nerd-fonts.caskaydia-cove
    # nerd-fonts.caskaydia-mono
    # nerd-fonts.code-new-roman
    # nerd-fonts.comic-shanns-mono
    # nerd-fonts.commit-mono
    # nerd-fonts.cousine
    # nerd-fonts.d2coding
    # nerd-fonts.daddy-time-mono
    # nerd-fonts.departure-mono
    # nerd-fonts.dejavu-sans-mono
    # nerd-fonts.droid-sans-mono
    # nerd-fonts.envy-code-r
    # nerd-fonts.fantasque-sans-mono
    # nerd-fonts.fira-code
    # nerd-fonts.fira-mono
    # nerd-fonts.geist-mono
    # nerd-fonts.go-mono
    # nerd-fonts.gohufont
    # nerd-fonts.hack
    # nerd-fonts.hasklug
    # nerd-fonts.heavy-data
    # nerd-fonts.hurmit
    # nerd-fonts.im-writing
    # nerd-fonts.inconsolata
    # nerd-fonts.inconsolata-go
    # nerd-fonts.inconsolata-lgc
    # nerd-fonts.intone-mono
    # nerd-fonts.iosevka
    # nerd-fonts.iosevka-term
    # nerd-fonts.iosevka-term-slab
    # nerd-fonts.jetbrains-mono

    # nerd-fonts.lekton
    # nerd-fonts.liberation
    # nerd-fonts.lilex
    # nerd-fonts.martian-mono
    # nerd-fonts.meslo-lg
    # nerd-fonts.monaspace
    # nerd-fonts.monofur
    # nerd-fonts.monoid
    # nerd-fonts.mononoki
    # nerd-fonts.noto
    # nerd-fonts.open-dyslexic
    # nerd-fonts.overpass
    # nerd-fonts.profont
    # nerd-fonts.proggy-clean-tt

    # nerd-fonts.recursive-mono
    # nerd-fonts.roboto-mono
    # nerd-fonts.shure-tech-mono
    # nerd-fonts.sauce-code-pro
    # nerd-fonts.space-mono
    nerd-fonts.symbols-only
    # nerd-fonts.terminess-ttf
    # nerd-fonts.tinos
    # nerd-fonts.ubuntu
    # nerd-fonts.ubuntu-mono
    # nerd-fonts.ubuntu-sans
    # nerd-fonts.victor-mono
    # nerd-fonts.zed-mono
  ];
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    TERMINAL = "kitty";
  };

  # programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [53317 8081];
  networking.firewall.allowedUDPPorts = [53317 8081];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
