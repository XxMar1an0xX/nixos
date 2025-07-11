{
  pkgs,
  lib,
  ...
}: {
  #NOTE: apps que ayudan mucho
  home.packages = with pkgs; [
    hyprsysteminfo
    hyprpaper
    clipse
    grimblast
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    # systemd.variables = ["--all"];
    settings = {
      # Keywords hyprland
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";
      "$browser" = "librewolf";

      # para cosas que arrancan al inicio
      exec-once = [
        "[workspace 2 silent] $terminal -e nvim $NH_FLAKE"
        "[workspace 1 silent] $browser"
        # "[workspace s silent] $terminal"
        "systemctl --user start hyprpolkitagent"
        "hyprpaper"
        "waybar"
        "clipse -listen"
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
        inactive_opacity = "0.8";

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
          "wind, 0.05, 0.9, 0.1, 1.05"
          "emphasizedDecel, 0.05, 0.7, 0.1, 1"
          "emphasizedAccel, 0.3, 0, 0.8, 0.15"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.52, 0.03, 0.72, 0.08"
        ];
        animation = [
          "border, 1, 10, emphasizedDecel"
          "windowsIn, 1, 3, emphasizedDecel, slide, popin 80%"
          "windowsOut, 1, 2, emphasizedDecel, slide, popin 90%"
          "windowsMove, 1, 3, emphasizedDecel, slide"

          # "fadeIn, 1, 1.73, almostLinear"
          # "fadeOut, 1, 1.46, almostLinear"
          "layersIn, 1, 2.7, emphasizedDecel, popin 93%"
          "layersOut, 1, 2.4, menu_accel, popin 94%"

          "fadeLayersIn, 1, 0.5, menu_decel"
          "fadeLayersOut, 1, 2.7, menu_accel"

          #NOTE: animacion de los workspaces
          "workspaces, 1, 5, wind"
          "specialWorkspaceOut, 1, 1.2, emphasizedAccel, slidevert"
          "specialWorkspaceIn, 1, 2.8, emphasizedDecel, slidevert"
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

        numlock_by_default = "true";

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
        "$mainMod, C, killactive"
        "$mainMod, Escape, exit"
        "$mainMod, V, togglefloating"
        # "$mainMod, P, pseudo"
        "$mainMod, T, togglesplit"

        # "$mainMod, left, movefocus, l"
        "$mainMod, H, movefocus, l"
        "$mainMod SHIFT, H, movewindow, l"
        # "$mainMod, right, movefocus, r"
        "$mainMod, L, movefocus, r"
        "$mainMod SHIFT, L, movewindow, r"
        # "$mainMod, up, movefocus, u"
        "$mainMod, K, movefocus, u"
        "$mainMod SHIFT, K, movewindow, u"
        # "$mainMod, down, movefocus, d"
        "$mainMod, J, movefocus, d"
        "$mainMod SHIFT, J, movewindow, d"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # "$mainMod, mouse_down, workspace, e+1"
        # "$mainMod, U, workspace, e+1"
        # "$mainMod, mouse_up, workspace, e-1"
        # "$mainMod, I, workspace, e-1"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod ALT, H, workspace, e-1"
        "$mainMod ALT, L, workspace, e+1"

        "ALT, F4, forcekillactive"

        #NOTE: sistema general <==
        "$mainMod Control SHIFT, X, exec, shutdown -h now"
        "$mainMod Control SHIFT, R, exec, reboot"

        #NOTE: keybinds de programas <==

        "$mainMod, N, exec, $terminal -e nvim $NH_FLAKE"
        "$mainMod, M, exec, $menu"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, Q, exec, $terminal -e bash -c 'neofetch; exec bash'"
        "$mainMod, B, exec, librewolf"
        " , code:148, exec, qalculate-qt"
        "$mainMod, A, exec, localsend_app"
        "$mainMod, P, exec, keepassxc"
        "$mainMod, D, exec, kicad"
        "$mainMod, W, exec, whatsie"
        "$mainMod, I, exec, $terminal --class clipse -e clipse"
        ", Print, exec, grimblast copysave area && mv *.png $HOME/Imagenes/Screenshots/"
        "SHIFT, Print, exec, grimblast copysave screen && mv *.png $HOME/Imagenes/Screenshots/"
      ];

      binds = [
      ];

      # binds = {
      #   drag_threshold = "5";
      # };
      # bindel = [
      #   ""
      # ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizeactive"
      ];
      # bindl = [
      #   ""
      # ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "float, class:(clipse)"
        "size 622 652, class:(clipse)"
        "stayfocused, class:(clipse)"
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
