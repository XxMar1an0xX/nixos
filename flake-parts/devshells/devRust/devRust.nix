{
  self,
  inputs,
  ...
}: {
  perSystem = {
    self',
    pkgs,
    ...
  }: {
    devenv.shells.devRust = let
      #NOTE: para egui
      # nix develop $CONFIG#devRust --no-pure-eval
      libPath = with pkgs;
        lib.makeLibraryPath [
          wayland-protocols
          wayland
          libxkbcommon
          libGL
        ];
    in {
      packages = [
        # pkgs.rust-bin.stable.latest.default
        self'.packages.NVF
      ];
      languages.rust = {
        enable = true;
        channel = "nixpkgs";
      };
      enterShell =
        /*
        bash
        */
        ''
          export LD_LIBRARY_PATH=${libPath}
          cd $HOME
          if ! test -e $HOME/Rust; then
                  git clone https://github.com/XxMar1an0xX/Rust.git
          else
                  cd $HOME/Rust
                  git pull --no-edit
          fi
          cd $HOME/Rust
        '';
    };
  };
}
