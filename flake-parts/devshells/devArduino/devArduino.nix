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
        pkgs.git
        pkgs.gh
        self'.packages.arduinoPatched
        self'.packages.arduinoNVF
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
          sudo cp -rf --symbolic-link --update ${libraryPath}/libraries/* $HOME/Arduino/libraries
          mkdir -p $HOME/.arduino15/packages
          sudo cp -rf --symbolic-link --update ${dataPath}/packages/* $HOME/.arduino15/packages
          if ! test -e $HOME/Documentos/ProgramacionMassa2026; then
                  cd $HOME/Documentos
                  git clone https://github.com/XxMar1an0xX/ProgramacionMassa2026.git
          else
                  cd $HOME/Documentos/ProgramacionMassa2026
                  git pull --no-edit
          fi
          cd $HOME/Documentos/ProgramacionMassa2026
          export ARDUINO="$HOME/Documentos/ProgramacionMassa2026"
        '';
      #TODO: se necesita agregar '--board-options FlashMode=dio' o 'esp32:esp32:esp32:FlashMode=dio' para que ande
    };
  };
}
