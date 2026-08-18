{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.niri = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard.xkb.layout = "latam";

        layout.gaps = 5;

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
        };
      };
    };
  };
}
