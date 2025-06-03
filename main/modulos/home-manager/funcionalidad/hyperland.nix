{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  #NOTE: apps que ayudan mucho
  home.packages = with pkgs; [
    wofi
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      # Keywords hyprland
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "wofi --show drun";
      "$browser" = "librewolf";

      # para cosas que arrancan al inicio
      exec-once = [
        "$terminal"
        "$browser"
      ];

      # Variables de entorno (Enviroment variables)
      env = [
        # "XCURSOR_SIZE,24"
        # "HYPRCURSOR_SIZE,24"
      ];

      #area general de config hypr
      # general = with config.colorScheme.colors; {
      general = {
        gaps_in = "5";
        gaps_out = "20";
        border_size = "2";
        # uso de variables tipo color
        # "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 45deg";
        # "col.inactive_border" = "rgba(${base00}ff)";

        resize_on_border = "true";

        #tearing config
        allow_tearing = "false";

        layout = "dwindle";

        snap = {
          enabled = "true";
        };
      };

      # configuracion de decoracion
      decoration = {
        rounding = "10";
        rounding_power = "2";

        active_opacity = "1.0";
        inactive_opacity = "0.9";

        shadow = {
          enabled = "true";
          range = "4";
          render_power = "3";
          # color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
        };
      };

      animations = {
        enabled = "true";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      dwindle = {
        pseudotile = "true";
        preserve_split = "true";
      };

      master = {
        new_status = "master";
      };

      misc = {
        # force_default_wallpaper = "1";
        disable_hyprland_logo = lib.mkForce false;
      };

      xwayland = {
        enabled = "true";
      };

      input = {
        kb_layout = "latam";
        # kb_variant = "deadtilde";
        kb_model = "microsoftinet";
        # kb_options = "";
        # kb_rules = "";

        follow_mouse = "1";

        sensitivity = "0";

        touchpad = {
          natural_scroll = "false";
        };
      };

      gestures = {
        workspace_swipe = "false";
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };

      "$mainMod" = "SUPER"; #tecla windows como modificador
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, B, exec, librewolf"
        "$mainMod, C, killactive"
        "$mainMod, Escape, exit"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating"
        "$mainMod, M, exec, $menu"
        "$mainMod, P, pseudo"
        "$mainMod, T, togglesplit"

        "$mainMod, left, movefocus, l"
        "$mainMod, H, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, L, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, K, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, J, movefocus, d"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, U, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, I, workspace, e-1"

        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"

        "ALT, F4, forcekillactive"
      ];
      binds = {
        drag_threshold = "5";
      };
      # bindel = [
      #   ""
      # ];

      # bindl = [
      #   ""
      # ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      monitor = [
        # "HDMI-A-1, modeline 168.28 1984 2104 2320 2656 1020 1021 1024 1056 -HSync +Vsync, 0x0, 1"
        "HDMI-A-1, 1984x1020@60, 0x0, 1, cm, srgb"
        # "HDMI-A-1, 1920x1080@60, 0x0, 1"
      ];
      render = {
        cm_enabled = "true";
      };

      experimental = {
        xx_color_management_v4 = "true";
      };
    };
  };
}
