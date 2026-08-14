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
    #TODO: no anda F
    # devenv.shells.devRust = inputs.devenv.lib.mkShell {
    #   inherit inputs pkgs;
    #   modules = [
    #     {
    #       packages = [
    #         # pkgs.rust-bin.stable.latest.default
    #         self'.packages.NVF
    #       ];
    #       languages.rust = {
    #         enable = true;
    #       };
    #       enterShell =
    #         /*
    #         bash
    #         */
    #         ''
    #           cd $HOME
    #           if ! test -e $HOME/Rust; then
    #                   git clone https://github.com/XxMar1an0xX/Rust.git
    #           else
    #                   cd $HOME/Rust
    #                   git pull --no-edit
    #           fi
    #           cd $HOME/Rust
    #         '';
    #     }
    #   ];
    # };
    devenv.shells.devRust = {...}: {
      languages.rust = {
        enable = true;
        channel = "nixpkgs";
      };
    };
  };
}
