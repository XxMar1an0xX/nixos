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
        dataPath = "${builtins.getAttr "dataPath" self'.packages.arduinoPatched}";
      in
        /*
        bash
        */
        ''
          mkdir -p $HOME/Arduino/libraries
          cp -r --symbolic-link --update ${libraryPath}/libraries/* $HOME/Arduino/libraries
          mkdir -p $HOME/.arduino15/packages
          cp -r --symbolic-link --update ${dataPath}/packages/* $HOME/.arduino15/packages

          # cp -f /nix/store/n1y7qz80bwv21hg84wl98mw1wykp7rfk-arduino-data/arduino-cli.yaml $HOME/.arduino15/arduino-cli.yaml
        '';
    };
  };
}
