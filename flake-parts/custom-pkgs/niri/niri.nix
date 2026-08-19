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
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
      settings = {
        prefer-no-csd = true;
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard = {
          xkb.layout = "latam";
          numlock = {};
        };

        outputs = {"DP-1".mode = "2560x1440@164.958";};

        layout.gaps = 5;

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = {};
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";

          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right = {};
          "Mod+K".focus-window-up = {};
          "Mod+J".focus-window-down = {};

          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};

          "Mod+Shift+H".consume-or-expel-window-left = {};
          "Mod+Shift+L".consume-or-expel-window-right = {};
          "Mod+Shift+K".move-window-up = {};
          "Mod+Shift+J".move-window-down = {};

          # "Mod+Super+K".sw
          "Mod+1".focus-workspace = "w0";
          "Mod+2".focus-workspace = "w1";
          "Mod+3".focus-workspace = "w2";
          "Mod+4".focus-workspace = "w3";
          "Mod+5".focus-workspace = "w4";
          "Mod+6".focus-workspace = "w5";
          "Mod+7".focus-workspace = "w6";
          "Mod+8".focus-workspace = "w7";
          "Mod+9".focus-workspace = "w8";
          "Mod+0".focus-workspace = "w9";

          "Mod+Shift+1".move-column-to-workspace = "w0";
          "Mod+Shift+2".move-column-to-workspace = "w1";
          "Mod+Shift+3".move-column-to-workspace = "w2";
          "Mod+Shift+4".move-column-to-workspace = "w3";
          "Mod+Shift+5".move-column-to-workspace = "w4";
          "Mod+Shift+6".move-column-to-workspace = "w5";
          "Mod+Shift+7".move-column-to-workspace = "w6";
          "Mod+Shift+8".move-column-to-workspace = "w7";
          "Mod+Shift+9".move-column-to-workspace = "w8";
          "Mod+Shift+0".move-column-to-workspace = "w9";

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "Mod+plus".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "Mod+KP_Add".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";

          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          "Mod+minus".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          "Mod+KP_Subtract".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

          "Mod+Ctrl+H".set-column-width = "-5%";
          "Mod+Ctrl+L".set-column-width = "+5%";
          "Mod+Ctrl+J".set-window-height = "-5%";
          "Mod+Ctrl+K".set-window-height = "+5%";

          "Mod+Shift+X".spawn-sh = "shutdown -h now";
          "Mod+Shift+R".spawn-sh = "reboot";

          "Mod+Alt+K".focus-workspace-up = {};
          "Mod+Alt+J".focus-workspace-down = {};

          "Mod+N".spawn-sh = "kitty bash -c 'cd $NH_FLAKE&&git pull --no-edit&&nvim .'";
          # "Mod+M".spawn-sh = "rofi";
          "Mod+W".spawn = "whatsapp-electron";
          "Mod+E".spawn-sh = "kitty bash -c yazi";
          "Mod+B".spawn = "firefox";
          "XF86Calculator".spawn = "qalculate-qt";
          "Mod+A".spawn = "localsend_app";
          "Mod+P".spawn = "keepassxc";
          "Mod+D".spawn = "kicad";
          "Mod+O".spawn-sh = "kitty bash -c btop";
          "XF86MonBrightnessUp".spawn-sh = "brightnessctl set +10%";
          "XF86MonBrightnessDown".spawn-sh = "brightnessctl set 10-%";

          #TODO: configurar captura de pantalla
        };

        workspaces = let
          settings = {layout.gaps = 5;};
        in {
          "w0" = settings;
          "w1" = settings;
          "w2" = settings;
          "w3" = settings;
          "w4" = settings;
          "w5" = settings;
          "w6" = settings;
          "w7" = settings;
          "w8" = settings;
          "w9" = settings;
        };
      };
    };
  };
}
