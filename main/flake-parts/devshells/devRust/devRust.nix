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
    devenv.shells.devRust = pkgs.mkShell {
      packages = [
        # pkgs.rust-bin.stable.latest.default
        self'.packages.NVF
      ];
      languages.rust = {
        enable = true;
      };
      enterShell =
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
          cd $HOME/Rust
        '';
    };
  };
}
