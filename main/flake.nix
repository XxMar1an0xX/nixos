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

    nixpkgs-droid = {
      # TODO: Pinned to specific nixpkgs commit as workaround for nix-community/nix-on-droid#495
      # Issue: "getting pseudoterminal attributes: Permission denied" with nixpkgs after 2026-01-24
      # pin to last working commit instead
      # https://github.com/nix-community/nix-on-droid/issues/495
      url = "github:nixos/nixpkgs/88d3861";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-droid";
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

  outputs = {...} @ inputs:
    inputs.flake-parts.lib.mkFlake {
      inherit inputs;
    }
    (top @ {...}: {
      imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.home-manager.flakeModules.home-manager
        (inputs.import-tree ./flake-parts)
      ];
      systems = ["x86_64-linux" "aarch64-linux"];

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
    });
}
