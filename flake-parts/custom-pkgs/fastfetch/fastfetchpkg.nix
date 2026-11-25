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
            "type" = "disk";
            "key" = "│ ├󰋊";
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
            "key" = "󰋋 AUDIO";
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
    };
  };
}
