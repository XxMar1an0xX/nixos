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
      ];
      shellHook =
        /*
        bash
        */
        ''


        '';
    };
  };
}
