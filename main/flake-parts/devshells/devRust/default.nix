{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    #TODO: este es dependiente del overlay definido en arduino-nix
    devShells.devRust = pkgs.mkShell {
      buildInputs = [
        pkgs.rust-bin.stable.latest.default
        self'.packages.NVF
      ];
      shellHook =
        /*
        bash
        */
        ''
          cd $HOME
          if ! test -e $HOME/Rust; then
                  git clone https://github.com/XxMar1an0xX/Rust.git
          else
                  cd $HOME/Rust
                  git pull --no-edit
          fi
          cd $HOME/nixos/main/
        '';
    };
  };
}
