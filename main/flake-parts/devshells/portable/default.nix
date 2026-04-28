{
  self,
  inputs,
  self',
  ...
}: {
  perSystem = {pkgs, ...}: {
    devShells.devConfig = pkgs.mkShell {
      packages = [
        pkgs.git
        pkgs.gh
        self'.packages.NVF
        # self'.packages.arduino
      ];
      shellHook =
        /*
        bash
        */
        ''
          if ! test -e $HOME/nixos; then
            git clone https://github.com/XxMar1an0xX/nixos.git
          fi
        '';
    };
  };
}
