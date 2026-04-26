{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.waybar = inputs.wrapper-modules.wrappers.waybar.wrap {
      inherit pkgs;
      settings = {
        mainbar = {
          height = 30;
          spacing = 4;
          modules-left = [
            "custom/os_button"
            "hyprland/workspaces"
            "hyprland/window"
            "cava"
          ];

          "hyprland/workspaces" = {
            "format" = "{icon} {windows}";
            "format-window-separator" = "  ";
            "window-rewrite-default" = "";
            "window-rewrite" = {
              "class<LibreWolf>" = "󰈹";
              "class<kitty>" = "";
              "class<kitty> title<nvim.*>" = "";
              "class<steam>" = "󰓓";
              "class<org.keepassxc.KeePassXC>" = "󱕴";
              "class<io.github.Qalculate.qalculate-qt>" = "󰪚";
              "class<virt-manager>" = "󰍺";
              "class<GitHub Desktop>" = "";
              "title<Cryptomator>" = "󰉐";
              "title<Hyprland Polkit Agent>" = "󰳌";
              "class<thunar>" = "";
              "class<localsend_app>" = "󰡰";
              "class<org.freecad.FreeCAD>" = "";
              # "class<>" = "";
              "class<GParted>" = "󱁋";
              "class<libreoffice>" = "";
              "class<libreoffice-math>" = "";
              "class<libreoffice-draw>" = "";
              "class<org.prismlauncher.PrismLauncher>" = "󰍳";
              "class<Rofi>" = "󰌧";
              "class<Minecraft*>" = "󰍳";
              # "class<>" = "";
              "class<.virt-manager-wrapped>" = "󰍺";
              "class<Arduino IDE>" = "";
              "class<org.nomacs.ImageLounge>" = "";
              "class<libreoffice-calc>" = "";
              "class<libreoffice-writer>" = "";
              "class<vlc>" = "󰕼";
              "class<com.ktechpit.whatsie>" = "";
              "class<kicad>" = "";
              "class<firefox>" = "󰈹";

              "class<processing-app-Base>" = "";
            };
            "icon-size" = 30;
            "spacing" = 16;
            "on-scroll-up" = "hyprctl dispatch workspace r+1";
            "on-scroll-down" = "hyprctl dispatch workspace r-1";
          };

          "custom/os_button" = {
            "format" = "";
            "size" = 30;
            "on-click" = "rofi -show drun";
            "tooltip" = "false";
          };

          "cava" = {
            #         "cava_config" = "$XDG_CONFIG_HOME/cava/cava.conf";
            "framerate" = 30;
            "autosens" = 1;
            "bars" = 16;
            "lower_cutoff_freq" = 50;
            "higher_cutoff_freq" = 10000;
            "method" = "pipewire";
            "source" = "auto";
            "stereo" = true;
            "bar_delimiter" = 0;
            "noise_reduction" = 0.77;
            "input_delay" = 2;
            "hide_on_silence" = true;
            "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
            "actions" = {
              "on-click-right" = "mode";
            };
          };
          modules-right = [
            "tray"
            "temperature"
            "pulseaudio"
            "disk"
            "memory"
            "cpu"
            "custom/wifi"
          ];

          "tray" = {
            "icon-size" = 18;
            "spacing" = 3;
          };

          "cpu" = {
            "interval" = 5;
            "format" = "  {usage}%";
            "max-length" = 10;
          };

          "memory" = {
            "interval" = 10;
            "format" = " {used:0.1f}GiB";
            "max-length" = 10;
            "tooltip" = true;
            "tooltip-format" = "RAM - {used:0.1f}GiB used";
          };

          "disk" = {
            "interval" = 30;
            "format" = "󰋊 {percentage_used}%";
            "path" = "/";
            "tooltip" = true;
            "unit" = "GB";
            "tooltip-format" = "Available {free} of {total}";
          };

          "hyprland/window" = {
            "format" = "{class}";
            "max-length" = 20;
          };

          "pulseaudio" = {
            "scroll-step" = 1;
            "format" = "{volume}% {icon} {format_source}";
            "format-bluetooth" = "{volume}% {icon} {format_source}";
            "format-bluetooth-muted" = " {icon} {format_source}";
            "format-muted" = " {format_source}";
            "format-source" = "{volume}% ";
            "format-source-muted" = "";
            "format-icons" = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = ["" "" ""];
            };
            # "on-click" = "pavucontrol"; #TODO: hacer herramienta parecida
          };

          "custom/wifi" = {
            "format" = "";
            "tooltip" = false;
            "on-click" = "kitty -e bash -c 'nmtui'";
          };

          "temperature" = {
            "hwmon-path-abs" = "/sys/devices/platform/coretemp.0/hwmon";
            "input-filename" = "temp2_input";
            "critical-threshold" = 75;
            "tooltip" = false;
            "format-critical" = "({temperatureC}°C)";
            "format" = "({temperatureC}°C)";
          };

          modules-center = [
            "clock"
          ];
          "clock" = {
            "format" = "{:>%I:%M %p - %d/%m/%y %a}";
            "timezone" = "America/Argentina/Tucuman";
            "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
        };
        # style = ''
        #
        #   * {
        #   font-family: hashtag;
        #   }
        # '';
      };
    };
  };
}
