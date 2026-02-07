{
  config,
  lib,
  pkgs,
  inputs,
  rust-overlay,
  ...
}: {
  # Simply install just the packages
  imports = [
    # ./../../modulos/nixconfig/Estetica/stylix.nix
  ];

  # nixpkgs.config = {};

  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    nerd-fonts.symbols-only
    ripgrep
    zsh
    nerd-fonts.sauce-code-pro
    perl

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    man
    gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    zip
    #unzip
    # rust-bin.stable.latest.default
  ];
  terminal.font = "${pkgs.nerd-fonts.sauce-code-pro}/share/fonts/truetype/NerdFonts/SauceCodePro/SauceCodeProNerdFont-Regular.ttf";

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  android-integration = {
    termux-open-url.enable = true;
    termux-open.enable = true;
  };
  user = {
    # userName = "Nix-Droid";
    # shell = "${pkgs.zsh}";
  };
  # user.  # Set your time zone
  #time.timeZone = "Europe/Berlin";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    # useGlobalPkgs = true;
    useGlobalPkgs = false;
    extraSpecialArgs = {
      # inherit pkgs;
      inherit rust-overlay;
      # inherit lib;
      inherit inputs;
      # inherit nvf;
    };
  };
}
