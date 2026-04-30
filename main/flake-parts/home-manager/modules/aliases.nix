{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliases = {
    home.shellAliases = {
      haziso = "nix run nixpkgs#nixos-generators -- --format iso --flake $NH_FLAKE#portable -o laptop";
      rephm = "sudo nixos-rebuild switch --flake $NH_FLAKE";
      rdev = "cd Documentos/Rust/Rust/";
      ds = "nix-on-droid switch --flake $HOME/nixos/main/";
      nc = "cd $HOME/nixos/main/ && git pull --no-edit && vi . && cd $HOME";
      ".." = "cd ..";
      x = "exit";
      ff = "fastfetch";
      ns = "nix-shell -p ";
    };
    home.packages = [
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      EDITOR = "nvim";
      TERMINAL = "kitty";
      CONFIG = "$HOME/nixos/main";
      REPO = "github:XxMar1an0xX/nixos?dir=main/";
    };
  };
}
