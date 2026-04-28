{
  self,
  inputs,
  self',
  ...
}: {
  perSystem = {pkgs, ...}: {
    devshells.devConfig = pkgs.mkShell {
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
