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
          if ! test -e $HOME/nixos; then
            git clone https://github.com/XxMar1an0xX/nixos.git
            else
            cd $HOME/nixos/main
            git pull --no-edit
            cd $HOME
          fi
          cd $HOME
        '';
    };
  };
}
