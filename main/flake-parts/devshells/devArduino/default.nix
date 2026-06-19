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
        # pkgs.arduino-cli
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
          sudo rm -rf $HOME/Arduino/libraries/*
          cp -r --symbolic-link --update ${libraryPath}/libraries/* $HOME/Arduino/libraries
          mkdir -p $HOME/.arduino15/packages
          sudo rm -rf $HOME/.arduino15/packages/*
          cp -r --symbolic-link --update ${dataPath}/packages/* $HOME/.arduino15/packages
          export ARDUINO="$HOME/Documentos/Arduino/"
        '';
      #TODO: se necesita agregar '--board-options FlashMode=dio' o 'esp32:esp32:esp32:FlashMode=dio' para que ande
    };
  };
}
