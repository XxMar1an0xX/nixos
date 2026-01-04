{
  pkgs,
  config,
  ...
}: {
  #   environment.systemPackages = with pkgs; [
  #     libsForQt5.qt5.qtgraphicaleffects
  #     libsForQt5.qt5.qtvirtualkeyboard
  #     libsForQt5.qt5.qtmultimedia
  #     libsForQt5.qt5.qtsvg
  #     ffmpeg
  #
  #     (pkgs.callPackage ./sddm-astronaut-theme.nix {
  #       # theme = "post-apocalyptic_hacker";
  #       theme = "jake_the_dog";
  #       # theme = "hyprland_kath";
  #       # theme = "japanese_aesthetic";
  #       # theme = "astronaut";
  #       # theme = "purple_leaves";
  #       # theme = "pixel_sakura(-static)";
  #       themeConfig = {
  #         General = {
  #           HeaderText = "NixOS";
  #           # Background = "/home/ruiz/Documentos/nixos/main/recursos/Summit.mp4";
  #           background = "/home/ruiz/Documentos/nixos/main/recursos/Celeste_Summit.jpg";
  #
  #           # Background = "${pkgs.fetchurl {
  #           #   url = "https://www.pixelstalk.net/wp-content/uploads/images7/Celeste-Wallpaper-Computer.png";
  #           #   hash = "sha256-fT/wJu5DwcZeY9wClkDcvgxvn1LhrHBBiWOfYMX+Ys0="; #NOTE: static
  #           # }}";
  #           # Background = "${pkgs.fetchurl {
  #           #   url = "https://www.desktophut.com/files/Celeste%20Summit%20Ending%20Live%20Wallpaper.m4v";
  #           #   hash = "sha256-7ATpD1x3tdTjoX33rHHjMlLwbqp46fL5eTE9mnsF1pQ=";
  #           # }}";
  #
  #           #NOTE: hacer esto con git fetch (independiente del sistema de archivos)
  #
  #           # BackgroundPlaceholder = "${config.stylix.image}";
  #           FullBlur = "false";
  #         };
  #         Colors = {
  #           HeaderTextColor = "#${config.lib.stylix.colors.base05}";
  #           # DateTextColor = config.lib.stylix.colors.base0A;
  #           # TimeTextColor = config.lib.stylix.colors.base0B;
  #           #
  #           # FormBackgroundColor = config.lib.stylix.colors.base01;
  #           BackgroundColor = "#fde086";
  #           DimBackgroundColor = "#fde086";
  #           #
  #           LoginFieldBackgroundColor = "#fde086";
  #           PasswordFieldBackgroundColor = "#fde086";
  #           # LoginFieldTextColor = config.lib.stylix.colors.base05;
  #           # PasswordFieldTextColor = config.lib.stylix.colors.base05;
  #           # UserIconColor = config.lib.stylix.colors.base0C;
  #           # PasswordIconColor = config.lib.stylix.colors.base0C;
  #           #
  #           # PlaceholderTextColor = config.lib.stylix.colors.base03;
  #           # WarningColor = config.lib.stylix.colors.base08;
  #           #
  #           # LoginButtonTextColor = config.lib.stylix.colors.base07;
  #           # # LoginButtonBackgroundColor = config.lib.stylix.colors.accent;
  #           # SystemButtonsIconsColor = config.lib.stylix.colors.base0C;
  #           # SessionButtonTextColor = config.lib.stylix.colors.base0C;
  #           # VirtualKeyboardButtonTextColor = config.lib.stylix.colors.base0C;
  #           #
  #           # DropdownTextColor = config.lib.stylix.colors.base07;
  #           # # DropdownSelectedBackgroundColor = config.lib.stylix.colors.accent;
  #           # DropdownBackgroundColor = config.lib.stylix.colors.base01;
  #           #
  #           # HighlightTextColor = config.lib.stylix.colors.base01;
  #           HighlightBackgroundColor = "#fde086";
  #           # HighlightBorderColor = config.lib.stylix.colors.accent;
  #           #
  #           # HoverUserIconColor = config.lib.stylix.colors.accent;
  #           # HoverPasswordIconColor = config.lib.stylix.colors.accent;
  #           # HoverSystemButtonsIconsColor = config.lib.stylix.colors.accent;
  #           # HoverSessionButtonTextColor = config.lib.stylix.colors.accent;
  #           # HoverVirtualKeyboardButtonTextColor = config.lib.stylix.colors.accent;
  #         };
  #       };
  #     })
  #   ];
  #
  #   services.xserver.displayManager.setupCommands = ''
  #     # xrandr -s 1920x1080
  #   '';
  #   #NOTE: sddm login
  #   services.displayManager = {
  #     sddm = {
  #       #NOTE: prueba de login:
  #       # sddm-greeter-qt6 --test-mode --theme /run/current-system/sw/share/sddm/themes/sddm-astronaut-theme
  #       package = pkgs.kdePackages.sddm; #NOTE: ME COSTO UNA TARDE ENTERA ENCONTRAR ESTA SOLUCION
  #       enable = true;
  #       settings = {
  #         General = {
  #           InputMethod = "qtvirtualkeyboard";
  #         };
  #         Wayland = {
  #           # EnableHiDPI = false;
  #         };
  #       };
  #       theme = "sddm-astronaut-theme";
  #       wayland.enable = true;
  #       extraPackages = with pkgs; [
  #         kdePackages.qtmultimedia
  #         kdePackages.qtsvg
  #         kdePackages.qtvirtualkeyboard
  #       ];
  #     };
  #     # gdm.enable = true;
  #   };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      # boring = "/Imagenes/Screenshots/2025-07-11T10:58:56,120120920-03:00.png";
      # kokomi = /home/ruiz/Documentos/nixos/main/recursos/Summit.mp4;
    };
  };
}
