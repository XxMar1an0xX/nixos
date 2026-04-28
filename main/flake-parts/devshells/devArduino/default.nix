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
    devShells.devArduino = pkgs.mkShell {
      packages = [
        self'.packages.arduino
        self'.packages.NVF
      ];
      shellHook =
        /*
        bash
        */
        '''';
    };
  };
}
