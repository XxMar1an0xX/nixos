{
  pkgs,
  lib,
  ...
}:
lib.mkIf custom.HacerPortable {
  #NOTE: portabilizacion hyprland
  wayland.windowManager.hyprland.settings = lib.mkForce {
    input = {
      kb_layout = "latam";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";
    };

    monitor = [
      "HDMI-A-1, 1920x1080@60, 0x0, 1"
    ];
  };
  #NOTE: portabilizacion waybar
}
