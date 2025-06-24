{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        height = 30;
        spacing = 4;
        modules-left = [
          "custom/os_button"
          "hyprland/workspaces"
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
            "class<org.cryptomator.launcher.Cryptomator$MainApp>" = "󰉐";
            "class<thunar>" = "";
            "class<localsend_app>" = "󰡰";
            # "class<>" = "";
            "class<libreoffice>" = "";
            "class<libreoffice-math>" = "";
            "class<libreoffice-draw>" = "";
            # "class<>" = "";
            "class<libreoffice-calc>" = "";
            "class<libreoffice-writer>" = "";
            "class<vlc>" = "󰕼";
            "class<com.ktechpit.whatsie>" = "";
            "class<kicad>" = "";
          };
          "icon-size" = 30;
          "spacing" = 16;
          "on-scroll-up" = "hyprctl dispatch workspace r+1";
          "on-scroll-down" = "hyprctl dispatch workspace r-1";
        };

        "custom/os_button" = {
          "format" = "";
          "size" = 30;
          "on-click" = "wofi --show drun";
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

        "pulseaudio" = {
          "max-volume" = 150;
          "scroll-step" = 1;
          "format" = "{icon}{volume}%";
          "tooltip-format" = "{volume}%";
          "format-muted" = " ";
          "format-icons" = {
            "default" = [
              " "
              " "
              " "
            ];
          };
          "on-click" = "pwvucontrol";
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
          "format" = "{:>%I:%M:%S %p - %d/%m/%y %a}";
          "timezone" = "America/Argentina/Tucuman";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
      # style = ''
      # '';
    };
  };
}
