{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliases = {config, ...}: {
    home.shellAliases = {
      haziso = "nix run nixpkgs#nixos-generators -- --format iso --flake $NH_FLAKE#portable -o laptop";
      rephm = "sudo nixos-rebuild switch --flake $NH_FLAKE#$HOST";
      rdev = "cd Documentos/Rust/Rust/";
      ds = "nix-on-droid switch --flake $CONFIG";
      nc = "cd $HOME/nixos && git pull --no-edit && vi . && cd $HOME";
      ".." = "cd ..";
      x = "exit";
      ff = "fastfetch";
      ns = "nix-shell -p ";
      # winoff = "docker compose --file ~/.config/winapps/compose.yaml stop";
      woff = "sudo systemctl stop docker-compose-winapps-root.target";
      # winon = "docker compose --file ~/.config/winapps/compose.yaml start";
      won = "sudo systemctl start docker-compose-winapps-root.target";
      wpause = "docker compose --file ~/.config/winapps/compose.yaml pause";
      wunpause = "docker compose --file ~/.config/winapps/compose.yaml unpause";
      ww = "winapps windows";
      nhs = "nh os switch --hostname $HOST";
      nr = "nh os repl --expr 'let flake = builtins.getFlake (toString ./nixos) ; in flake'";
    };
    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      EDITOR = "nvim";
      TERMINAL = "kitty";
      CONFIG = "$HOME/nixos";
      REPO = "github:XxMar1an0xX/nixos";
    };
  };
}
