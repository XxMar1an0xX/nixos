# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
{
  modulesPath,
  inputs,
  self,
  config,
  pkgs,
  ...
}: {
  # custom.HacerPortable = true; #NOTE: FUNCIONAAAAA
  imports = let
    EsPortable =
      if (config ? custom.HacerPortable)
      then config.custom.HacerPortable
      else false;
    CondicionalPortable = Si: No: (
      if EsPortable
      then Si
      else No
    );
  in [
    {
      _module.args = {
        inherit CondicionalPortable;
        inherit EsPortable;
      };
    }
    # self.nixosModules.default
    #NOTE: funcionalidad
    ./../../modulos/nixconfig/funcionalidad/invidious.nix
    ./../../modulos/nixconfig/funcionalidad/VMs.nix
    ./../../modulos/nixconfig/funcionalidad/juegos.nix
    ./../../modulos/nixconfig/funcionalidad/hardware.nix
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
  ];

  # ++ CondicionalPortable [
  #   "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  # ] [];
  #NOTE: esto para poder formatear tranquilo
  boot.supportedFilesystems = [
    "nfts"
    "exfat"
  ];

  home-manager = {
    extraSpecialArgs = let
      EsPortable =
        if (config ? custom.HacerPortable)
        then config.custom.HacerPortable
        else false;
    in {
      inherit inputs;
      inherit EsPortable;
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

    backupFileExtension = "ahfwenciu";
    #de-comentar si se rompe home-manager
    useGlobalPkgs = true;
  };

  qt.enable = true;
  hardware.graphics.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = let
    CondicionalPortable = Si: No: (
      if
        if (config ? custom.HacerPortable)
        then config.custom.HacerPortable
        else false
      then Si
      else No
    );
  in {
    firewall.allowedTCPPorts = [53317 8081 22000];
    firewall.allowedUDPPorts = [53317 8081 22000];
    hostName = "nixos";
    stevenblack = {
      enable = true;
      block = ["porn"];
    };

    networkmanager =
      CondicionalPortable {
        enable = true;
        wifi.powersave = true;
        unmanaged = ["*-foo-bar"];
        wireless = {
          enable = false;
          userControlled.enable = true;
          dbusControlled = true;
        };
      } {
        enable = true;
      };
    hosts = {
      "0.0.0.0" = [
        "youtube.com"
        "www.youtube.com"
        "inv.nadeko.net"
      ];
    };
  };

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
  services.xserver.xkb = let
    CondicionalPortable = Si: No: (
      if
        if (config ? custom.HacerPortable)
        then config.custom.HacerPortable
        else false
      then Si
      else No
    );
  in {
    layout = "latam";
    # variant = "";
    model = CondicionalPortable "" "microsoftinet";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  #NOTE: impresoras
  services.printing = {
    enable = true;
    drivers = with pkgs; [epson-escpr epson-escpr2];
    openFirewall = true;
    # extraConf = ''
    # '';
  };
  hardware.printers = let
    CondicionalPortable = Si: No: (
      if
        if (config ? custom.HacerPortable)
        then config.custom.HacerPortable
        else false
      then Si
      else No
    );
  in {
    ensurePrinters = CondicionalPortable [] [
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
    extraGroups = ["networkmanager" "wheel" "tty" "dialout" "adbusers"];
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
    # (callPackage ./../../modulos/nixconfig/custompkgs/MiNixOsConfig.nix {
    #   inherit lib;
    #   inherit pkgs;
    # })
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
  systemd.user.services.autoinicio = let
    CondicionalPortable = Si: No: (
      if
        if (config ? custom.HacerPortable)
        then config.custom.HacerPortable
        else false
      then Si
      else No
    );
  in {
    description = "autoinicio al loguearse";
    serviceConfig.PassEnvironment = "DISPLAY";
    script =
      CondicionalPortable
      /*
      bash
      */
      ''          #NOTE: generar repo de git y tmbn reemplazar hardware-configuration

        hyprland
        if ! test -e /home/ruiz/Documentos; then
        mkdir ./Descargas
        mkdir ./Documentos
        fi

               if ! test -e /home/ruiz/Documentos/nixos; then
                       cd /home/ruiz/Documentos || return
                       git clone https://github.com/XxMar1an0xX/nixos.git
                       if [[ ! $TERMINAL = kitty ]]; then
                               echo "reemplazando hardware config con el necesario"
                               rm -f /home/ruiz/Documentos/nixos/main/hardware-configuration.nix
                               nixos-generate-config --show-hardware-config >>/home/ruiz/Documentos/nixos/main/hardware-configuration.nix
                       fi
               fi
      ''
      /*
      bash
      */
      ''
          hyprland
          # sudo umount /run/media/
          mkdir /home/ruiz/Descargas
          mkdir /home/ruiz/Documentos
          git clone https://github.com/XxMar1an0xX/nixos.git ./Documentos
          git clone https://github.com/XxMar1an0xX/Rust.git ./Documentos
        sudo umount /run/media/sddm/Respaldo
      '';
    wantedBy = ["multi-user.target"]; # starts after login
  };
  # security.polkit = {
  #   enable = true;
  # };

  fonts.packages = with pkgs; [
    (callPackage ./../../modulos/nixconfig/custompkgs/hashtag.nix {
      inherit lib;
      inherit pkgs;
    })
    (callPackage ./../../modulos/nixconfig/custompkgs/ammys.nix {
      inherit lib;
      inherit pkgs;
    })
    (callPackage ./../../modulos/nixconfig/custompkgs/journal.nix {
      inherit lib;
      inherit pkgs;
    })
    (callPackage ./../../modulos/nixconfig/custompkgs/jp-hand.nix {
      inherit lib;
      inherit pkgs;
    })
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

  environment.variables = {
    EDITOR = "nvim";
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };
  environment.shellAliases = {
    haziso = "nix run nixpkgs#nixos-generators -- --format iso --flake $NH_FLAKE#portable -o laptop";
    rephm = "sudo nixos-rebuild switch --flake $NH_FLAKE";
    rdev = "cd Documentos/Rust/Rust/";
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
