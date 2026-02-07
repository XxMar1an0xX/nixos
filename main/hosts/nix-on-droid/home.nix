{
  pkgs,
  inputs,
  rust-overlay,
  # nvf,
  ...
}: {
  nixpkgs.overlays = [
    rust-overlay.overlays.default
  ];
  # Read the changelog before changing this value
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    mp3gain
    unzip
    rust-bin.stable.latest.default
  ];

  imports = [
    ./../../modulos/home-manager/fastfetch.nix
    # ./test.nix
    ./../../modulos/home-manager/github.nix

    ./../../modulos/home-manager/config-cortas.nix
    # ./../../modulos/home-manager/stylix-hm.nix
  ];
  fonts.fontconfig = {
    enable = true;
    # defaultFonts.emoji = pkgs.nerd-fonts.symbols-only;
  };

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.zsh = {
    enable = true;
  };

  programs.home-manager.enable = true;
  # insert home-manager config
  home.shellAliases = {
    ds = "nix-on-droid switch --flake $HOME/nixos/main/";
    nc = "cd $HOME/nixos/main/ && git pull --no-edit && vi .";
    ".." = "cd ..";
    x = "exit";
  };
  systemd.services.fastfetch = {
    wantedBy = ["multi-user.target"];
    # path = [ pkgs.coreutils ];
    enable = true;
    serviceConfig = {
      User = "nix-on-droid";
      # Group = "root";
    };
    script = ''fastfetch'';
  };
}
