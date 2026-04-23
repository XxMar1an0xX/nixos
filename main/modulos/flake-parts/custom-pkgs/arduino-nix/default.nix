{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    system,
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
    # arduinoOverlay = [
    #   (arduino-nix.overlay)
    #   (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_index.json"))
    #   (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_rp2040_index.json"))
    #   (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_esp32_index.json"))
    #   (arduino-nix.mkArduinoLibraryOverlay (arduino-index + "/index/library_index.json"))
    packages.arduino = pkgs.wrapArduinoCLI {
      #TODO: arduinolsp no detecta estas lirerias, solo las que estan en la carpeta normal
      libraries = with pkgs.arduinoLibraries; [
        (arduino-nix.latestVersion TMCStepper)
        (arduino-nix.latestVersion LiquidCrystal)
        (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit PWM Servo Driver Library")
        (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit NeoPixel")
        (arduino-nix.latestVersion NimBLE-Arduino)
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
    };
  };
}
