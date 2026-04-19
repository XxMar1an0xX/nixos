{
  description = "Flake principal de configuracion Nix general";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixai.url = "github:olafkfreund/nix-ai-help";

    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";

    nvf.url = "github:notashelf/nvf";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arduino-nix.url = "github:bouk/arduino-nix";
    arduino-index = {
      url = "github:bouk/arduino-indexes";
      flake = false;
    };

    #NOTE:para roblox
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    #NOTE: flake-parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = {
    # nixai,
    nixpkgs,
    stylix,
    nix-on-droid,
    home-manager,
    nvf,
    self,
    nixos-hardware,
    rust-overlay,
    # flake-utils,
    arduino-nix,
    arduino-index,
    nix-flatpak,
    # nixpkgs-unstable-droid,
    ...
  } @ inputs: let
    # system = "x86_64-linux";
    # # pkgs = nixpkgs.legacyPackages.${system};
    #
    # arduinoOverlay = [
    #   (arduino-nix.overlay)
    #   (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_index.json"))
    #   (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_rp2040_index.json"))
    #   (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_esp32_index.json"))
    #   (arduino-nix.mkArduinoLibraryOverlay (arduino-index + "/index/library_index.json"))
    #
    #   rust-overlay.overlays.default
    # ];
    #
    # pkgs = import nixpkgs {
    #   system = "x86_64-linux";
    #   overlays = arduinoOverlay;
    # };
    #
    # hola = "${
    #   self.packages.arduino-cli
    # }";
    # configModule =
    #   import ./modulos/flake-nix/NVF.nix;
    # CustomNVF = nvf.lib.neovimConfiguration {
    #   modules = [
    #     {
    #       _module.args = {
    #         inherit hola;
    #       };
    #     }
    #     configModule
    #   ];
    #   inherit pkgs;
    # }; #NOTE: esto de arriba en de Neovim NVF
    #
    # lib = pkgs.lib;
    # libPath = with pkgs;
    #   lib.makeLibraryPath [
    #     wayland-protocols
    #     wayland
    #     libxkbcommon
    #     libGL
    #   ];
    #
    # arduinoPackage = pkgs.wrapArduinoCLI {
    #   #TODO: arduinolsp no detecta estas lirerias, solo las que estan en la carpeta normal
    #   libraries = with pkgs.arduinoLibraries; [
    #     (arduino-nix.latestVersion TMCStepper)
    #     (arduino-nix.latestVersion LiquidCrystal)
    #     (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit PWM Servo Driver Library")
    #     (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit NeoPixel")
    #     (arduino-nix.latestVersion NimBLE-Arduino)
    #     # (arduino-nix.latestVersion LiquidCrystal)
    #     # (arduino-nix.latestVersion LiquidCrystal)
    #     # (arduino-nix.latestVersion LiquidCrystal)
    #   ];
    #
    #   packages = with pkgs.arduinoPackages; [
    #     #NOTE: es platforms.${packages_name}.${architecture}.${version}
    #     platforms.arduino.avr."1.8.7"
    #     # platforms.rp2040.rp2040."2.3.3"
    #     platforms.esp32.esp32."3.3.7"
    #   ];
    # };
  in
    inputs.flake-parts.lib.mkFlake {
      inherit inputs;
    }
    (top @ {...}: {
      imports = [
        # inputs.flake-parts.flakeModules.modules
        inputs.home-manager.flakeModules.home-manager
        (inputs.import-tree ./modulos/flake-parts)
      ];

      # packages.${system}.default = CustomNVF.neovim;
      #
      # packages.aarch64-linux.default =
      #   (nvf.lib.neovimConfiguration {
      #     modules = [
      #       {
      #         _module.args = let
      #           hola = "${self.packages.aarch64-linux.arduino-cli}";
      #         in {
      #           inherit hola;
      #         };
      #       }
      #       configModule
      #     ];
      #     pkgs = import nixpkgs {
      #       system = "aarch64-linux";
      #       overlays = arduinoOverlay;
      #     };
      #   }).neovim;
      #
      # packages.arduino-cli = arduinoPackage;
      #
      # packages.aarch64-linux.arduino-cli = let
      #   pkgs = import nixpkgs {
      #     system = "aarch64-linux";
      #     overlays = arduinoOverlay;
      #   };
      # in
      #   pkgs.wrapArduinoCLI {
      #     #TODO: arduinolsp no detecta estas lirerias, solo las que estan en la carpeta normal
      #     libraries = with pkgs.arduinoLibraries; [
      #       (arduino-nix.latestVersion TMCStepper)
      #       (arduino-nix.latestVersion LiquidCrystal)
      #       (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit PWM Servo Driver Library")
      #       (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit NeoPixel")
      #       (arduino-nix.latestVersion NimBLE-Arduino)
      #       # (arduino-nix.latestVersion LiquidCrystal)
      #       # (arduino-nix.latestVersion LiquidCrystal)
      #       # (arduino-nix.latestVersion LiquidCrystal)
      #     ];
      #
      #     packages = with pkgs.arduinoPackages; [
      #       #NOTE: es platforms.${packages_name}.${architecture}.${version}
      #       platforms.arduino.avr."1.8.7"
      #       # platforms.rp2040.rp2040."2.3.3"
      #       platforms.esp32.esp32."3.3.7"
      #     ];
      #   };
      # # use "nixos", or your hostname as the name of the configuration
      # # it's a better practice than "default" shown in the video
      #
      # devShells.default = pkgs.mkShell {
      #   name = "rust-dev-shell";
      #
      #   buildInputs = with pkgs;
      #     lib.flatten [
      #       rust-bin.stable.latest.default
      #
      #       # nushell
      #
      #       # u-config
      #       wayland
      #       wayland-protocols
      #     ];
      #
      #   shellHook = ''
      #     echo "Using Rust toolchain: $(rustc --version)"
      #
      #     # export CARGO_HOME="$HOME/.cargo"
      #     # export RUSTUP_HOME="$HOME/.rustup"
      #     # export LD_LIBRARY_PATH="${libPath}"
      #     # mkdir -p "$CARGO_HOME" "$RUSTUP_HOME"
      #
      #     # Launch nushell as login shell
      #     # exec nu --login
      #   '';
      # };
      #
      # nixosModules.default = {lib, ...}: {
      #   options = {
      #     custom.HacerPortable = lib.mkOption {
      #       type = lib.types.bool;
      #       default = false;
      #     };
      #   };
      # };
      #
      # nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      #   modules = [
      #     ./hosts/nix-on-droid/nix-on-droid.nix
      #     # stylix.nixOnDroidModules.stylix
      #     (
      #       {pkgs, ...}: {
      #         # nixpkgs.overlays = [
      #         #   rust-overlay.overlays.default
      #         # ];
      #         environment.packages = [
      #           self.packages.aarch64-linux.default
      #           self.packages.aarch64-linux.arduino-cli
      #           # pkgs.rust-bin.stable.latest.default
      #         ];
      #       }
      #     )
      #     # list of extra modules for Nix-on-Droid system
      #     # { nix.registry.nixpkgs.flake = nixpkgs; }
      #     # ./path/to/module.nix
      #     #kdksks
      #
      #     # or import source out-of-tree modules like:
      #     # flake.nixOnDroidModules.module
      #   ];
      #
      #   # list of extra special args for Nix-on-Droid modules
      #   extraSpecialArgs = {
      #     inherit rust-overlay;
      #     # rootPath = ./.;
      #     # inherit nvf;
      #     # inherit outputs;
      #     inherit inputs;
      #   };
      #
      #   # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
      #   pkgs = import nixpkgs-unstable-droid {
      #     system = "aarch64-linux";
      #
      #     overlays = [
      #       nix-on-droid.overlays.default
      #
      #       # rust-overlay.overlays.default
      #       # add other overlays
      #     ];
      #   };
      #
      #   # set path to home-manager flake
      #   home-manager-path = home-manager.outPath;
      # };
    });
}
