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
      nc = "cd $HOME/nixos/main/ && git pull --no-edit && vi . &&cd ./../..";
      ".." = "cd ..";
      x = "exit";
      ff = "fastfetch";
      ns = "nix-shell -p ";
    };
  };
}
