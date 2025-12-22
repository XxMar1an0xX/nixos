{
  config,
  lib,
  pkgs,
  inputs,
  # nvf,
  ...
}: {
  # Simply install just the packages
  imports = [
    # inputs.nixvim.nixosModules.nixvim
  ];

  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    nerd-fonts.symbols-only

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # user.shell = "${pkgs.kitty}/bin/kitty";
  # Set your time zone
  #time.timeZone = "Europe/Berlin";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    extraSpecialArgs = {
      # inherit pkgs;
      # inherit lib;
      inherit inputs;
      # inherit nvf;
    };
  };
}
