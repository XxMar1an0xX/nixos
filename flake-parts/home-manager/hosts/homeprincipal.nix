{
  self,
  inputs,
  ...
}: {
  flake.homeModules.homeprincipal = {
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.homeModules.fastfetch
      self.homeModules.firefox
      self.homeModules.github
      self.homeModules.hyprland
      self.homeModules.kitty
      self.homeModules.winapps
      # self.homeModules.rofi
      self.homeModules.syncthing
      self.homeModules.waybar
      self.homeModules.config-cortas
      self.homeModules.aliases
      self.homeModules.commonHome
      self.homeModules.minecraft

      #TODO: parece que stylix no funciona con este tipo de config
      # self.homeModules.stylix
      {
        wayland.windowManager.sway = {
          enable = true;
          config = {
            startup = [
              {command = "${lib.getExe pkgs.polkit_gnome}";} # Noctalia may already be running in your Niri session.
              {command = "${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia}";}
            ];
            output = {"DP-1" = {mode = "2560x1440@164.958Hz";};};
            # input = {
            #   "type:keyboard" = {
            #     xkblayout = "latam";
            #     xkbnumlock = "enabled";
            #   };
            input = {
              "*" = {
                # omitting other config options
                xkb_layout = "se";
              };
            }; # };
            gaps = {
              inner = 5;
              outer = 5;
            };
            # terminal = "kitty";
            # menu = "noctalia-shell ipc call launcher toggle";
            modifier = "Mod4";
            # modifier = "Alt";
            keybindings = {
              # Applications
              "Mod4+Return" = "exec kitty";
              "Mod4+q" = "kill";
              "Mod4+s" = "exec ${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia} ipc call launcher toggle";

              "Mod4+n" = "exec kitty bash -c 'cd $NH_FLAKE && git pull --no-edit && nvim .'";
              "Mod4+w" = "exec whatsapp-electron";
              "Mod4+e" = "exec kitty bash -c yazi";
              "Mod4+b" = "exec firefox";
              "Mod4+a" = "exec localsend_app";
              "Mod4+p" = "exec keepassxc";
              "Mod4+d" = "exec kicad";
              "Mod4+o" = "exec kitty bash -c btop";

              "XF86Calculator" = "exec qalculate-qt";

              # Focus windows
              "Mod4+h" = "focus left";
              "Mod4+l" = "focus right";
              "Mod4+k" = "focus up";
              "Mod4+j" = "focus down";

              "Mod4+Left" = "focus left";
              "Mod4+Right" = "focus right";
              "Mod4+Up" = "focus up";
              "Mod4+Down" = "focus down";

              # Move windows
              "Mod4+Shift+h" = "move left";
              "Mod4+Shift+l" = "move right";
              "Mod4+Shift+k" = "move up";
              "Mod4+Shift+j" = "move down";

              # Workspaces
              "Mod4+1" = "workspace number 1";
              "Mod4+2" = "workspace number 2";
              "Mod4+3" = "workspace number 3";
              "Mod4+4" = "workspace number 4";

              "Mod4+Shift+1" = "move container to workspace number 1";
              "Mod4+Shift+2" = "move container to workspace number 2";
              "Mod4+Shift+3" = "move container to workspace number 3";
              "Mod4+Shift+4" = "move container to workspace number 4";

              # Volume
              "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
              "Mod4+plus" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
              "Mod4+KP_Add" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";

              "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
              "Mod4+minus" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
              "Mod4+KP_Subtract" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

              # Resize containers
              "Mod4+Ctrl+h" = "resize shrink width 5 ppt";
              "Mod4+Ctrl+l" = "resize grow width 5 ppt";
              "Mod4+Ctrl+j" = "resize shrink height 5 ppt";
              "Mod4+Ctrl+k" = "resize grow height 5 ppt";

              # Power
              "Mod4+Shift+x" = "exec shutdown -h now";
              "Mod4+Shift+r" = "exec reboot";

              # Screenshots (requires grim)
              "Mod4+Print" = "exec grim";
              "Mod4+Shift+Print" = "exec grim -g \"$(slurp)\"";
              "Print" = "exec grim";

              # Workspace navigation
              "Mod4+Alt+k" = "workspace prev";
              "Mod4+Alt+j" = "workspace next";

              # Window state
              "Mod4+Shift+f" = "fullscreen toggle";
              "Mod4+Shift+v" = "floating toggle";
              "Mod4+Shift+m" = "layout toggle split";

              # Overview has no direct Sway equivalent.
              # Use a third-party overview tool if desired.

              # Music
              "Mod4+Shift+p" = "exec cvlc -Z -L --audio-replay-gain-mode=track $HOME/Musica/*";
              "Mod4+Shift+minus" = "exec pkill .vlc-wrapped";
              "Mod4+Next" = "exec playerctl next";
              "Mod4+Prior" = "exec playerctl previous";
              "Mod4+space" = "exec playerctl play-pause";

              # Brightness
              "XF86MonBrightnessUp" = "exec brightnessctl set +10%";
              "XF86MonBrightnessDown" = "exec brightnessctl set 10-%";
            };
          };
        };
      }
    ];
  };
}
