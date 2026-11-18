{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.fastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
      inherit pkgs;
      settings = {
        logo = {
          source = "nixos";
          type = "builtin";
          color = {
            "1" = "#4D6FB7";
            "2" = "#77B6E1";
            "3" = "#4D6FB7";
            "4" = "#77B6E1";
            "5" = "#4D6FB7";
            "6" = "#77B6E1";
          };
        };
        display = {
          "separator" = " 󰑃  ";
        };
        modules = [
          "break"
          {
            "type" = "os";
            "key" = " DISTRO";
            "keyColor" = "yellow";
          }
          {
            "type" = "kernel";
            "key" = "│ ├󰐱";
            "keyColor" = "yellow";
          }
          {
            "type" = "packages";
            "key" = "│ ├󰏖";
            "keyColor" = "yellow";
          }
          {
            "type" = "shell";
            "key" = "│ └";
            "keyColor" = "yellow";
          }
          {
            "type" = "wm";
            "key" = " DE/WM";
            "keyColor" = "blue";
          }
          {
            "type" = "wmtheme";
            "key" = "│ ├󰉼";
            "keyColor" = "blue";
          }
          {
            "type" = "icons";
            "key" = "│ ├󰀻";
            "keyColor" = "blue";
          }
          {
            "type" = "cursor";
            "key" = "│ ├";
            "keyColor" = "blue";
          }
          {
            "type" = "terminalfont";
            "key" = "│ ├";
            "keyColor" = "blue";
          }
          {
            "type" = "terminal";
            "key" = "│ └";
            "keyColor" = "blue";
          }
          {
            "type" = "host";
            "key" = "󰌢 SYSTEM";
            "keyColor" = "green";
          }
          {
            "type" = "cpu";
            "key" = "│ ├󰻠";
            "keyColor" = "green";
          }
          {
            "type" = "gpu";
            "key" = "│ ├󰻑";
            "format" = "{2}";
            "keyColor" = "green";
          }
          {
            "type" = "display";
            "key" = "│ ├󰍹";
            "keyColor" = "green";
            "compactType" = "original-with-refresh-rate";
          }
          {
            "type" = "memory";
            "key" = "│ ├󰾆";
            "keyColor" = "green";
          }
          {
            "type" = "swap";
            "key" = "│ ├󰓡";
            "keyColor" = "green";
          }
          {
            "type" = "uptime";
            "key" = "│ ├󰅐";
            "keyColor" = "green";
          }
          {
            "type" = "display";
            "key" = "│ └󰍹";
            "keyColor" = "green";
          }
          {
            "type" = "sound";
            "key" = " AUDIO";
            "format" = "{2}";
            "keyColor" = "magenta";
          }
          {
            "type" = "player";
            "key" = "│ ├󰥠";
            "keyColor" = "magenta";
          }
          {
            "type" = "media";
            "key" = "│ └󰝚";
            "keyColor" = "magenta";
          }
          "break"
        ];
      };
      # settings = {
      #   display = {separator = " -> ";};
      #
      #   modules = [
      #     "break"
      #
      #     {
      #       type = "custom";
      #       format = "╭────────────────────── Hardware ──────────────────────╮";
      #       outputColor = "red";
      #     }
      #
      #     {
      #       type = "title";
      #       key = " PC";
      #       keyColor = "green";
      #       format = "{user-name-colored} on {host-name-colored}";
      #     }
      #
      #     {
      #       type = "cpu";
      #       key = "│ ├󰍛 CPU";
      #       showPeCoreCount = true;
      #       format = "{name} {freq-max}";
      #       keyColor = "green";
      #     }
      #
      #     {
      #       type = "gpu";
      #       key = "│ ├󰍛 GPU";
      #       keyColor = "green";
      #       format = "{vendor} {name}";
      #     }
      #
      #     {
      #       type = "disk";
      #       key = "│ ├󱛟 Disk";
      #       keyColor = "green";
      #     }
      #
      #     {
      #       type = "memory";
      #       key = "└ └󰍛 Memory";
      #       keyColor = "green";
      #     }
      #
      #     {
      #       type = "custom";
      #       format = "╰──────────────────────────────────────────────────────╯";
      #       outputColor = "red";
      #     }
      #
      #     "break"
      #
      #     {
      #       type = "custom";
      #       format = "╭────────────────────── Software ──────────────────────╮";
      #       outputColor = "red";
      #     }
      #
      #     {
      #       type = "os";
      #       key = " OS";
      #       keyColor = "yellow";
      #       # TODO: use the pretty name
      #       # format = "{pretty-name} {version-id} {codename}";
      #       format = "NixOS {version-id} {codename}";
      #     }
      #
      #     {
      #       type = "kernel";
      #       key = "│ ├ Kernel";
      #       keyColor = "yellow";
      #     }
      #
      #     {
      #       type = "shell";
      #       key = "│ ├ Shell";
      #       keyColor = "yellow";
      #       format = "{1}";
      #     }
      #
      #     {
      #       type = "packages";
      #       key = "│ ├󰏖 Packages";
      #       keyColor = "yellow";
      #     }
      #
      #     {
      #       type = "command";
      #       key = "│ ├ OS Age";
      #       keyColor = "yellow";
      #       text = ''
      #         birth_install=$(stat -c %W /); \
      #         current=$(date +%s); \
      #         time_progression=$((current - birth_install)); \
      #         days_difference=$((time_progression / 86400)); \
      #         echo $days_difference days
      #       '';
      #     }
      #
      #     {
      #       type = "uptime";
      #       key = "└ └ Uptime";
      #       keyColor = "yellow";
      #     }
      #
      #     "break"
      #
      #     # {
      #     #   type = "de";
      #     #   key = "DE";
      #     #   keyColor = "blue";
      #     #   # outputColor = "blue";
      #     #   # format = " DE -> default";
      #     #   format = "{1}";
      #     # }
      #     {
      #       type = "de";
      #       key = " DE";
      #       keyColor = "blue";
      #       format = "{1}";
      #     }
      #
      #     {
      #       type = "wm";
      #       key = "│ ├ Compositor";
      #       keyColor = "blue";
      #       format = "{1}";
      #     }
      #
      #     {
      #       type = "lm";
      #       key = "│ ├ Login";
      #       keyColor = "blue";
      #       format = "{1}";
      #     }
      #
      #     {
      #       type = "terminal";
      #       key = "│ ├ Terminal";
      #       keyColor = "blue";
      #       format = "{1}";
      #     }
      #
      #     {
      #       type = "terminalfont";
      #       key = "│ ├ Font";
      #       keyColor = "blue";
      #       format = "{name}";
      #     }
      #
      #     {
      #       type = "icons";
      #       key = "│ ├󰄛 Icons";
      #       keyColor = "blue";
      #     }
      #
      #     {
      #       type = "custom";
      #       key = "└ └ Theme";
      #       keyColor = "blue";
      #       format = "NordFox";
      #     }
      #
      #     {
      #       type = "custom";
      #       format = "╰──────────────────────────────────────────────────────╯";
      #       outputColor = "red";
      #     }
      #
      #     {
      #       type = "colors";
      #       paddingLeft = 20;
      #       symbol = "circle";
      #     }
      #
      #     "break"
      #   ];
      # };
    };
  };
}
