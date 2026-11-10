{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {lib, ...}: {
    programs.noctalia = {
      enable = true;
      # settings = lib.mkForce (lib.fromTOML (builtins.readFile ./../../../recursos/noctalia-config.toml));
      settings = {
        audio = {enable_overdrive = true;};
        bar = {
          default = {
            end = [
              "clipboard"
              "notifications"
              "tray"
              "network"
              "cpu"
              "ram"
              "volume"
              "session"
            ];
            scale = 1.1;
            start = [
              "workspaces"
              "media"
              "battery"
              "bluetooth"
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
        desktop_widgets = {
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
        };
        # dock = {
        #   auto_hide = true;
        #   background_opacity = 1.0;
        # };
        location = {
          address = "San Miguel de Tucuman";
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
                background_color = "surface_variant";
                background_opacity = 0.88;
                background_radius = 12;
                center_password_text = false;
                input_opacity = 1;
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
          widget_order = ["lockscreen-login-box@DP-1"];
        };
        notification = {
          # background_opacity = 1.0;
          max_visible = 3;
        };
        osd = {background_opacity = 1.0;};
        plugin_settings = {
          # "noctalia/mpvpaper" = {video_directory = "/home/ruiz/nixos/recursos/wallpaper";};
        };
        plugins = {
          # enabled = ["noctalia/wallpaper_depth"];
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
          };
        };
        widget = {
          clock = {format = "{:%H:%M:%S}";};
          notifications = {enabled = false;};
        };
      };
      checkConfig = true;
    };
  };
}
