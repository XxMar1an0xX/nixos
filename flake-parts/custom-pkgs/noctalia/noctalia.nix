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
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia.wrap {
      inherit pkgs;
      # package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      # settings = {
      #   audio = {enable_overdrive = true;};
      #   bar = {
      #     default = {
      #       end = [
      #         "clipboard"
      #         "bar"
      #         "tray"
      #         "toggle"
      #         "network"
      #         "widget_2"
      #         "volume"
      #         "session"
      #       ];
      #       scale = 1.1;
      #       start = [
      #         "active-workspace"
      #         "media"
      #         "battery"
      #         "updates"
      #         "status"
      #         "printer"
      #         "bluetooth"
      #         "widget"
      #       ];
      #     };
      #   };
      #   control_center = {
      #     shortcuts = [
      #       {type = "wifi";}
      #       {type = "bluetooth";}
      #       {type = "caffeine";}
      #       {type = "nightlight";}
      #       {type = "weather";}
      #     ];
      #     sidebar = "full";
      #   };
      #   desktop_widgets = {
      #     grid = {
      #       cell_size = 16;
      #       major_interval = 4;
      #       visible = true;
      #     };
      #     schema_version = 2;
      #     widget = {
      #       desktop-widget-0000000000000001 = {
      #         box_height = 176;
      #         box_width = 2560;
      #         cx = 1280;
      #         cy = 1352;
      #         output = "DP-1";
      #         placement_height = 1440;
      #         placement_width = 2560;
      #         rotation = 0;
      #         settings = {
      #           background = false;
      #           bands = 100;
      #           centered = false;
      #           color_1 = "shadow";
      #           color_2 = "primary";
      #           mirrored = false;
      #           reversed = false;
      #           show_when_idle = true;
      #         };
      #         type = "audio_visualizer";
      #       };
      #       desktop-widget-0000000000000002 = {
      #         box_height = 64;
      #         box_width = 272;
      #         cx = 1280;
      #         cy = 80;
      #         output = "DP-1";
      #         placement_height = 1440;
      #         placement_width = 2560;
      #         rotation = 0;
      #         settings = {
      #           background = false;
      #           background_color = "surface";
      #           background_opacity = 0.8;
      #           background_padding = 10;
      #           background_radius = 12;
      #           center_text = true;
      #           circle = true;
      #           clock_style = "digital";
      #           color = "on_surface";
      #           font_family = "";
      #           format = "{:%H:%M:%S}";
      #           shadow = true;
      #           show_seconds = true;
      #           timezone = "";
      #         };
      #         type = "clock";
      #       };
      #     };
      #     widget_order = [
      #       "desktop-widget-0000000000000001"
      #       "desktop-widget-0000000000000002"
      #     ];
      #   };
      #   dock = {background_opacity = 1;};
      #   location = {
      #     address = "";
      #     auto_locate = true;
      #   };
      #   lockscreen_widgets = {
      #     enabled = false;
      #     grid = {
      #       cell_size = 16;
      #       major_interval = 4;
      #       visible = true;
      #     };
      #     schema_version = 2;
      #     widget = {
      #       "lockscreen-login-box@DP-1" = {
      #         box_height = 196;
      #         box_width = 810;
      #         cx = 1280;
      #         cy = 1258;
      #         output = "DP-1";
      #         placement_height = 1440;
      #         placement_width = 2560;
      #         rotation = 0;
      #         settings = {
      #           background_color = "surface_container";
      #           background_opacity = 0.88;
      #           background_radius = 12;
      #           center_password_text = false;
      #           input_opacity = 1;
      #           input_radius = 6;
      #           layout = "regular";
      #           show_caps_lock = true;
      #           show_keyboard_layout = true;
      #           show_login_button = true;
      #           show_media = true;
      #           show_password_reveal = true;
      #           show_session_buttons = true;
      #           show_unlock_hint = true;
      #           show_weather = true;
      #         };
      #         type = "login_box";
      #       };
      #       "lockscreen-login-box@eDP-1" = {
      #         box_height = 196;
      #         box_width = 810;
      #         cx = 768;
      #         cy = 682;
      #         output = "eDP-1";
      #         placement_height = 864;
      #         placement_width = 1536;
      #         rotation = 0;
      #         settings = {
      #           background_color = "surface_container";
      #           background_opacity = 0.88;
      #           background_radius = 12;
      #           center_password_text = false;
      #           input_opacity = 1;
      #           input_radius = 6;
      #           layout = "regular";
      #           show_caps_lock = true;
      #           show_keyboard_layout = true;
      #           show_login_button = true;
      #           show_media = true;
      #           show_password_reveal = true;
      #           show_session_buttons = true;
      #           show_unlock_hint = true;
      #           show_weather = true;
      #         };
      #         type = "login_box";
      #       };
      #     };
      #     widget_order = ["lockscreen-login-box@eDP-1"];
      #   };
      #   notification = {
      #     background_opacity = 1;
      #     max_visible = 3;
      #   };
      #   osd = {background_opacity = 1;};
      #   plugin_settings = {
      #     "andrewdems/printers" = {show_when_idle = true;};
      #     "cleboost/hotspot" = {
      #       autostart = false;
      #       panel_position = "auto";
      #       password = "hola1111";
      #       ssid = "Laptop Zona Wifi";
      #     };
      #     "noctalia/wallpaper_depth" = {
      #       feather = 10;
      #       threshold = 68;
      #     };
      #     "omerfuyar/process-manager" = {admin = "terminal";};
      #     "omertahaoztop/vikunja" = {
      #       api_token = " tk_d924509feb2da55548a9efbd80b300bd6651c954";
      #       base_url = "https://taskyruiz.duckdns.org";
      #       manager_placement = "attached";
      #     };
      #   };
      #   plugins = {
      #     enabled = [
      #       "omertahaoztop/vikunja"
      #       "rylos/syncthing"
      #       "dmopp/nixos-updates"
      #       "andrewdems/printers"
      #       "0rgl/localsend-plus"
      #       "salemsayed/niri-active-workspace"
      #       "weinguyen/procmon"
      #       "noctalia/wallpaper_depth"
      #     ];
      #   };
      #   shell = {
      #     app_icon_color = "on_surface";
      #     avatar_path = "/home/ruiz/nixos/recursos/GoldenSlime.jpg";
      #     font_family = "DejaVu Sans";
      #     screen_time_enabled = true;
      #   };
      #   theme = {
      #     builtin = "Noctalia";
      #     community_palette = "Nord Aurora";
      #     custom_palette = "stylix";
      #     mode = "dark";
      #     source = "wallpaper";
      #     wallpaper_scheme = "m3-tonal-spot";
      #   };
      #   wallpaper = {
      #     default = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
      #     directory = "/home/ruiz/nixos/recursos/wallpaper";
      #     fill_mode = "fit";
      #     last = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
      #     monitors = {
      #       DP-1 = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
      #       eDP-1 = {path = "/home/ruiz/nixos/recursos/wallpaper/2u0w54h3ftfa1.png";};
      #     };
      #   };
      #   widget = {
      #     active-workspace = {
      #       label_mode = "index";
      #       type = "salemsayed/niri-active-workspace:active-workspace";
      #     };
      #     audio_visualizer = {bands = 45;};
      #     bar = {type = "rylos/syncthing:bar";};
      #     clock = {format = "{:%H:%M:%S}";};
      #     media = {max_length = 150;};
      #     notifications = {enabled = false;};
      #     printer = {
      #       enable_scroll = false;
      #       font_scale = 0.93;
      #       type = "andrewdems/printers:printer";
      #     };
      #     status = {type = "omertahaoztop/vikunja:status";};
      #     toggle = {type = "cleboost/hotspot:toggle";};
      #     updates = {type = "dmopp/nixos-updates:updates";};
      #     widget = {type = "0rgl/localsend-plus:widget";};
      #     widget_2 = {
      #       font_scale = 1.03;
      #       show_count = false;
      #       type = "weinguyen/procmon:widget";
      #     };
      #     workspaces = {enabled = false;};
      #   };
      # };
    };
  };
}
