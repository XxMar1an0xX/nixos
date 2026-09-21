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
    _module.args.pkgs =
      import (
        if system == "aarch64-linux"
        then inputs.nixpkgs-droid
        else inputs.nixpkgs
      ) {
        inherit system;
        overlays = [
          inputs.arduino-nix.overlay
          (inputs.arduino-nix.mkArduinoPackageOverlay (inputs.arduino-index + "/index/package_index.json"))
          (inputs.arduino-nix.mkArduinoPackageOverlay (inputs.arduino-index + "/index/package_rp2040_index.json"))
          (inputs.arduino-nix.mkArduinoPackageOverlay (inputs.arduino-index + "/index/package_esp32_index.json"))
          (inputs.arduino-nix.mkArduinoLibraryOverlay (inputs.arduino-index + "/index/library_index.json"))
          # inputs.rust-overlay.overlays.default
        ];
        config = {
          allowUnfree = true;
        };
      };
    packages.arduino =
      pkgs.wrapArduinoCLI
      {
        libraries = with pkgs.arduinoLibraries; [
          # (inputs.arduino-nix.latestVersion TMCStepper)
          (inputs.arduino-nix.latestVersion LiquidCrystal)
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit PWM Servo Driver Library")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit NeoPixel")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."ESP Async WebServer")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."Async TCP")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."ESPUI")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."LittleFS_esp32")
          (inputs.arduino-nix.latestVersion pkgs.arduinoLibraries."ArduinoJson")
          # (inputs.arduino-nix.latestVersion NimBLE-Arduino)
        ];

        packages = with pkgs.arduinoPackages; [
          #NOTE: es platforms.${packages_name}.${architecture}.${version}
          platforms.arduino.avr."1.8.8"
          platforms.esp32.esp32."3.3.11"
        ];
      };

    packages.arduinoPatched =
      self'.packages.arduino
    .overrideAttrs {
        buildCommand =
          /*
          bash
          */
          ''
            makeWrapper ${pkgs.arduino-cli}/bin/arduino-cli $out/bin/arduino-cli --set ARDUINO_UPDATER_ENABLE_NOTIFICATION false
          '';
        # --set ARDUINO_DIRECTORIES_DATA ${old.passthru.dataPath}
      };
  };
}
