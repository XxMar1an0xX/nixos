{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.configLaptop = {
    modulesPath,
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.hardwareLaptop
    ];
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.NVF
    ];
    boot.supportedFilesystems = [
      "nfts"
      "exfat"
    ];
    qt.enable = true;
    hardware.graphics.enable = true;
    networking = {
      firewall.allowedTCPPorts = [53317 8081 22000];
      firewall.allowedUDPPorts = [53317 8081 22000];
      hostName = "laptop";
      stevenblack = {
        enable = true;
        block = ["porn"];
      };

      wireless = {
        enable = true;
        userControlled.enable = true;
        dbusControlled = true;
      };
      #NOTE: wifi
      networkmanager = {
        enable = true;
        wifi.powersave = true;
        unmanaged = ["*-foo-bar"];
      };
      hosts = {
        "0.0.0.0" = [
          # "youtube.com"
          # "www.youtube.com"
          # "inv.nadeko.net"
          # "www.reddit.com"
          # "olympusbiblioteca.com"
        ];
      };
    };

    #NOTE: defaults
    time.timeZone = "America/Argentina/Tucuman";
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
    services.xserver.xkb = {
      layout = "latam";
      model = "pc104";
    };
    console.keyMap = "la-latin1";

    #NOTE: impresoras
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
    users.users.ruiz = {
      isNormalUser = true;
      description = "ruiz";
      extraGroups = ["networkmanager" "wheel" "tty" "dialout" "adbusers"];
      hashedPassword = "$y$j9T$130s2ATsRL5ixDudKitBG/$bqE8TWji9UmfWrZgX/791zqONEFPu7ivzPS/PmjN0j7";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    programs.hyprlock.enable = true;

    fonts.packages = with pkgs; [
      dejavu_fonts
      nerd-fonts.symbols-only
    ];
    fonts.fontDir.enable = true;
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
      ];
    };
    nix.settings.experimental-features = ["nix-command" "flakes"];

    system.stateVersion = "24.11"; # Did you read the comment?
    #NOTE: bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    services.blueman.enable = true;
  };
}
