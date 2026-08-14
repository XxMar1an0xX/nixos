{
  self,
  inputs,
  # self',
  ...
}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    devShells.devConfig = pkgs.mkShell {
      packages = [
        pkgs.git
        pkgs.gh
        self'.packages.NVF
      ];
      shellHook =
        /*
        bash
        */
        ''
          cd $HOME
          if ! test -e $HOME/nixos; then
                  git clone https://github.com/XxMar1an0xX/nixos.git
          else
                  cd $HOME/nixos
                  git pull --no-edit
          fi
          cd $HOME/nixos
        '';
    };
  };
}
