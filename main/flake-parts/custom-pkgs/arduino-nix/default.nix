{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    system,
    self',
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        (inputs.arduino-nix.overlay)
        (inputs.arduino-nix.mkArduinoPackageOverlay (inputs.arduino-index + "/index/package_index.json"))
        (inputs.arduino-nix.mkArduinoPackageOverlay (inputs.arduino-index + "/index/package_rp2040_index.json"))
        (inputs.arduino-nix.mkArduinoPackageOverlay (inputs.arduino-index + "/index/package_esp32_index.json"))
        (inputs.arduino-nix.mkArduinoLibraryOverlay (inputs.arduino-index + "/index/library_index.json"))

        inputs.rust-overlay.overlays.default
      ];
      config = {
        allowUnfree = true;
      };
    };
    packages.arduino =
      pkgs.wrapArduinoCLI
      {
        #TODO: arduinolsp no detecta estas lirerias, solo las que estan en la carpeta normal
        libraries = with pkgs.arduinoLibraries; [
          (inputs.arduino-nix.latestVersion TMCStepper)
          (inputs.arduino-nix.latestVersion LiquidCrystal)
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit PWM Servo Driver Library")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit NeoPixel")
          (inputs.arduino-nix.latestVersion NimBLE-Arduino)
          # (arduino-nix.latestVersion LiquidCrystal)
          # (arduino-nix.latestVersion LiquidCrystal)
          # (arduino-nix.latestVersion LiquidCrystal)
        ];

        packages = with pkgs.arduinoPackages; [
          #NOTE: es platforms.${packages_name}.${architecture}.${version}
          platforms.arduino.avr."1.8.7"
          # platforms.rp2040.rp2040."2.3.3"
          platforms.esp32.esp32."3.3.7"
        ];
        #NOTE: aqui se hace un override para habilitar librerias arbitrarias
      };
    # .overrideAttrs (old: {
    #   buildCommand = ''
    #     mkdir $HOME/.arduino15/libraries
    #     cp --symbolic-link ${old.passthru.userPath}/libraries/* $HOME/.arduino15/libraries
    #     makeWrapper ${pkgs.arduino-cli}/bin/arduino-cli $out/bin/arduino-cli --set ARDUINO_UPDATER_ENABLE_NOTIFICATION false --set ARDUINO_DIRECTORIES_DATA ${old.passthru.dataPath} --set ARDUINO_DIRECTORIES_USER $HOME/.arduino15/libraries
    #     echo "override succesful"
    # '';
    # });

    packages.arduinoPatched =
      self'.packages.arduino
    .overrideAttrs (old: {
        buildCommand =
          /*
          bash
          */
          ''
            makeWrapper ${pkgs.arduino-cli}/bin/arduino-cli $out/bin/arduino-cli --set ARDUINO_UPDATER_ENABLE_NOTIFICATION false --set ARDUINO_DIRECTORIES_DATA ${old.passthru.dataPath}
          '';
        # --set ARDUINO_DIRECTORIES_DATA ${old.passthru.dataPath}
      });
    #TODO: Verificar si en arduino data directory se puede hacer andar el lsp con libs
  };
}
