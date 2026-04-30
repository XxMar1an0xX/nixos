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
        self'.packages.arduinoPatched
        self'.packages.NVF
      ];
      shellHook = let
        libraryPath = "${builtins.getAttr "userPath" self'.packages.arduinoPatched}";
      in
        /*
        bash
        */
        ''
          mkdir -p $HOME/Arduino/libraries
          cp -r --symbolic-link --update ${libraryPath}/libraries/* $HOME/Arduino/libraries
        '';
    };
  };
}
