{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {
    lib,
    isLaptop,
    pkgs,
    ...
  }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];
    programs.noctalia = {
      enable = true;
      # package = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
      # settings = lib.mkForce (lib.fromTOML (builtins.readFile ./../../../recursos/noctalia-config.toml));
      settings = {
        audio = {enable_overdrive = true;};
        bar = {
          default = {
            end = [
              "clipboard"
              "bar"
              "tray"
              "toggle"
              "network"
              "cpu"
              "ram"
              "volume"
              "session"
            ];
            scale = 1.1;
            start = [
              "active-workspace"
              "media"
              "battery"
              "updates"
              "status"
              "printer"
              "bluetooth"
              "widget"
              "widget_3"
            ];
          };
        };
        control_center = {
          shortcuts = [
            {type = "wifi";}
            {type = "bluetooth";}
            {type = "caffeine";}
            {type = "nightlight";}
            {type = "weather";}
          ];
          sidebar = "full";
        };
        desktop_widgets =
          if isLaptop
          then {
            grid = {
              cell_size = 16;
              major_interval = 4;
              visible = true;
            };
            schema_version = 2;
            widget = {
              desktop-widget-0000000000000001 = {
                box_height = 176;
                box_width = 2560;
                cx = 1280;
                cy = 1352;
                output = "DP-1";
                placement_height = 1440;
                placement_width = 2560;
                rotation = 0;
                settings = {
                  background = false;
                  bands = 100;
                  centered = false;
                  color_1 = "shadow";
                  color_2 = "primary";
                  mirrored = false;
                  reversed = false;
                  show_when_idle = true;
                };
                type = "audio_visualizer";
              };
              desktop-widget-0000000000000002 = {
                box_height = 64;
                box_width = 272;
                cx = 1280;
                cy = 80;
                output = "DP-1";
                placement_height = 1440;
                placement_width = 2560;
                rotation = 0;
                settings = {
                  background = false;
                  background_color = "surface";
                  background_opacity = 0.8;
                  background_padding = 10;
                  background_radius = 12;
                  center_text = true;
                  circle = true;
                  clock_style = "digital";
                  color = "on_surface";
                  font_family = "";
                  format = "{:%H:%M:%S}";
                  shadow = true;
                  show_seconds = true;
                  timezone = "";
                };
                type = "clock";
              };
            };
            widget_order = [
              "desktop-widget-0000000000000001"
              "desktop-widget-0000000000000002"
            ];
          }
          else {
            grid = {
              cell_size = 16;
              major_interval = 4;
              visible = true;
            };
            schema_version = 2;
            widget = {
              desktop-widget-0000000000000001 = {
                box_height = 176;
                box_width = 2560;
                cx = 1280;
                cy = 1033.56;
                output = "DP-1";
                placement_height = 1440;
                placement_width = 2560;
                rotation = -0.0387802;
                settings = {
                  background = false;
                  background_color = "surface";
                  background_opacity = 0.8;
                  background_padding = 10;
                  background_radius = 12;
                  bands = 72;
                  centered = false;
                  color_1 = "primary";
                  color_2 = "primary";
                  mirrored = false;
                  reversed = false;
                  show_wave = false;
                  show_when_idle = true;
                };
                type = "audio_visualizer";
              };
              desktop-widget-0000000000000002 = {
                box_height = 64;
                box_width = 272;
                cx = 1280;
                cy = 80;
                output = "DP-1";
                placement_height = 1440;
                placement_width = 2560;
                rotation = 0;
                settings = {
                  background = false;
                  background_color = "surface";
                  background_opacity = 0.8;
                  background_padding = 10;
                  background_radius = 12;
                  center_text = true;
                  circle = true;
                  clock_style = "digital";
                  color = "on_surface";
                  font_family = "";
                  format = "{:%H:%M:%S}";
                  shadow = true;
                  show_seconds = true;
                  timezone = "";
                };
                type = "clock";
              };
            };
            widget_order = ["desktop-widget-0000000000000001"];
          };
        dock = {background_opacity = 1.0;};
        location = {
          address = "";
          auto_locate = true;
        };
        lockscreen_widgets = {
          enabled = false;
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          schema_version = 2;
          widget = {
            "lockscreen-login-box@DP-1" = {
              box_height = 196;
              box_width = 810;
              cx = 1280;
              cy = 1258;
              output = "DP-1";
              placement_height = 1440;
              placement_width = 2560;
              rotation = 0;
              settings = {
                background_color = "surface_container";
                background_opacity = 0.88;
                background_radius = 12;
                center_password_text = false;
                input_opacity = 1.0;
                input_radius = 6;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = true;
                show_media = true;
                show_password_reveal = true;
                show_session_buttons = true;
                show_unlock_hint = true;
                show_weather = true;
              };
              type = "login_box";
            };
            "lockscreen-login-box@eDP-1" = {
              box_height = 196;
              box_width = 810;
              cx = 768;
              cy = 682;
              output = "eDP-1";
              placement_height = 864;
              placement_width = 1536;
              rotation = 0;
              settings = {
                background_color = "surface_container";
                background_opacity = lib.mkForce 0.88;
                background_radius = 12;
                center_password_text = false;
                input_opacity = 1.0;
                input_radius = 6;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = true;
                show_media = true;
                show_password_reveal = true;
                show_session_buttons = true;
                show_unlock_hint = true;
                show_weather = true;
              };
              type = "login_box";
            };
          };
          widget_order = ["lockscreen-login-box@eDP-1"];
        };
        notification = {
          background_opacity = 1.0;
          max_visible = 3;
        };
        osd = {background_opacity = 1.0;};
        plugin_settings = {
          "andrewdems/printers" = {show_when_idle = true;};
          "cleboost/hotspot" = {
            autostart = false;
            panel_position = "auto";
            password = "hola1111";
            ssid = "Laptop Zona Wifi";
          };
          "noctalia/wallpaper_depth" = {
            feather = 10;
            threshold = 68;
          };
          "omerfuyar/process-manager" = {admin = "terminal";};
          "omertahaoztop/vikunja" = {
            api_token = " tk_d924509feb2da55548a9efbd80b300bd6651c954";
            base_url = "https://taskyruiz.duckdns.org";
            manager_placement = "attached";
          };
        };
        plugins = {
          enabled = [
            "omertahaoztop/vikunja"
            "rylos/syncthing"
            "dmopp/nixos-updates"
            "andrewdems/printers"
            "0rgl/localsend-plus"
            "salemsayed/niri-active-workspace"
            "weinguyen/procmon"
            "noctalia/wallpaper_depth"
            "tordex/processes"
          ];
          auto_update = "none";

          # Official plugin repository
          source = [
            {
              name = "nix-official";
              kind = "path";
              location = "${inputs.noctalia-official-plugins}";
              enabled = true;
            }

            {
              name = "nix-community";
              kind = "path";
              location = "${inputs.noctalia-community-plugins}";
              enabled = true;
            }
          ];
        };
        shell = {
          app_icon_color = "on_surface";
          avatar_path = "/home/ruiz/nixos/recursos/GoldenSlime.jpg";
          font_family = "DejaVu Sans";
          screen_time_enabled = true;
        };
        theme = {
          builtin = "Noctalia";
          community_palette = "Nord Aurora";
          custom_palette = "stylix";
          mode = "dark";
          source = lib.mkForce "wallpaper";
          wallpaper_scheme = "m3-tonal-spot";
        };
        wallpaper = lib.mkForce {
          default = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
          directory = "/home/ruiz/nixos/recursos/wallpaper";
          fill_mode = "fit";
          last = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
          monitors = {
            DP-1 = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
            eDP-1 = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
          };
        };
        widget = {
          active-workspace = {
            label_mode = "index";
            type = "salemsayed/niri-active-workspace:active-workspace";
          };
          audio_visualizer = {bands = 45;};
          bar = {type = "rylos/syncthing:bar";};
          clock = {format = "{:%H:%M:%S}";};
          cpu = {glyph = "cpu";};
          media = {max_length = 150;};
          notifications = {enabled = false;};
          printer = {
            enable_scroll = false;
            font_scale = 0.93;
            type = "andrewdems/printers:printer";
          };
          ram = {glyph = "storage";};
          status = {type = "omertahaoztop/vikunja:status";};
          toggle = {type = "cleboost/hotspot:toggle";};
          updates = {type = "dmopp/nixos-updates:updates";};
          widget = {type = "0rgl/localsend-plus:widget";};
          widget_2 = {
            font_scale = 1.03;
            show_count = false;
            type = "weinguyen/procmon:widget";
          };
          widget_3 = {type = "tordex/processes:widget";};
          workspaces = {enabled = false;};
        };
      };
      checkConfig = true;
    };
    home.packages = with pkgs; [
      # python3
      # python3Packages.pillow
      # python3Packages.numpy
      # python3Packages.onnxruntime
      # python3Packages.pip
      gtk3
      gobject-introspection
      adwaita-icon-theme
      hicolor-icon-theme
      # (python3.withPackages (ps:
      #   with ps; [
      #   ]))
      iw
      (let
        myPython = python3.withPackages (ps:
          with ps; [
            numpy
            psutil
            pygobject3
            onnxruntime
            pillow
          ]);
      in
        runCommand "python3-gtk-env" {
          nativeBuildInputs = [makeWrapper];
        } ''
          mkdir -p $out/bin
          makeWrapper ${myPython}/bin/python3 $out/bin/python3 \
              --prefix GI_TYPELIB_PATH : "${lib.makeSearchPath "lib/girepository-1.0" [
            gtk3
            gobject-introspection
            pango.out
            pango.dev
            gdk-pixbuf
            atk
            harfbuzz.out
            harfbuzz.dev
            glib.dev
          ]}" \
              --prefix XDG_DATA_DIRS : "${lib.makeSearchPath "share" [
            gtk3
            adwaita-icon-theme
            hicolor-icon-theme
            dejavu_fonts
          ]}"
        '')
    ];
  };
}
