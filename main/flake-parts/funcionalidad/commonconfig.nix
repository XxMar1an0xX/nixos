{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.commonconfig = {
    config,
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      hyprpolkitagent
      alejandra
    ];

    #TODO: deberia investigar que hacen estas opciones...
    services.xserver.enable = true;
    qt.enable = true;
    hardware.graphics.enable = true;

    #NOTE: networking
    networking = {
      firewall.allowedTCPPorts = [53317 8081 22000];
      firewall.allowedUDPPorts = [53 67 53317 8081 22000];
      stevenblack = {
        enable = true;
        block = ["porn"];
      };
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
      hosts = {
        "0.0.0.0" = [
          # "youtube.com"
          # "www.youtube.com"
          # "inv.nadeko.net"
          "www.reddit.com"
          "olympusbiblioteca.com"
        ];
      };
    };
    networking.firewall.checkReversePath = "loose";

    #NOTE: defaults de hora, lugar y teclado
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
    console.keyMap = "la-latin1";

    #NOTE: impresoras
    # Enable CUPS to print documents.
    services.printing = {
      enable = true;
      drivers = with pkgs; [epson-escpr epson-escpr2];
      openFirewall = true;
      # extraConf = ''
      # '';
    };
    hardware.printers = {
      ensurePrinters = [
        {
          name = "Impresora_Nueva_L3250";
          model = "epson-inkjet-printer-escpr/Epson-L3250_Series-epson-escpr-en.ppd";
          location = "Casa";
          deviceUri = "dnssd://EPSON%20L3250%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-64c6d2d3b3a0";
          description = "Local Printer";
          ppdOptions = {
            PageSize = "A4";
          };
        }
      ];
    };

    #NOTE: no me acuerdo que hacia avahi...
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    #NOTE: Enable sound with pipewire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    #NOTE: secret(?)
    boot.initrd.systemd.dbus.enable = true;
    services.dbus.enable = true;
    services.passSecretService = {
      enable = true;
      package = pkgs.pass-secret-service;
    };
    services.dbus.packages = with pkgs; [
      pass-secret-service
    ];

    #NOTE: usuario
    users.users.ruiz = {
      isNormalUser = true;
      description = "ruiz";
      extraGroups = ["networkmanager" "wheel" "tty" "dialout" "adbusers"];
      hashedPassword = "$y$j9T$130s2ATsRL5ixDudKitBG/$bqE8TWji9UmfWrZgX/791zqONEFPu7ivzPS/PmjN0j7";
      #NOTE: nunca olvidar password
    };

    #NOTE: home-manager config
    imports = [
      inputs.home-manager.nixosModules.default
    ];
    home-manager = {
      backupFileExtension = "ahfdsawenciu";
      extraSpecialArgs = {
        inherit inputs;
        #NOTE: inherit config; DOES NOT WORK
      };
      users = {
        ruiz = {
          imports = [self.homeModules.homeManager];
        };
      };
      useGlobalPkgs = true;
    };

    #NOTE: Hyprland
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    programs.hyprlock.enable = true;
    hardware.display.edid = {
      enable = true;
    };

    #NOTE: fuentes
    fonts.packages = with pkgs; [
      dejavu_fonts
      nerd-fonts.symbols-only
    ];
    fonts.fontDir.enable = true;

    #NOTE: xdg portal
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        # xdg-desktop-portal-wlr
        # xdg-desktop-portal-luminous
        xdg-desktop-portal-hyprland
      ];
      xdgOpenUsePortal = true;
      # config = {};
    };
    environment.etc."xdg-desktop-portal/portals.conf".text = ''
      [preferred]
      default=hyprland;gtk
      org.freedesktop.impl.portal.ScreenCast=hyprland
      org.freedesktop.impl.portal.Screenshot=hyprland
    '';

    #NOTE: rustdesk
    # services.rustdesk-server = {
    #   enable = true;
    #   openFirewall = true;
    # };

    #NOTE: habilitar flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
  };
}
