{
  pkgs,
  lib,
  HacerPortable,
  config,
  custom ? false,
  ...
}:
with lib; {
  # config = mkIf config.custom.HacerPortable {
  config = mkIf custom {
    #NOTE: portabilizacion hyprland
    wayland.windowManager.hyprland.settings = {
      input = mkForce {
        kb_layout = "latam";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
      };

      monitor = mkForce [
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
      ];
    };
    #NOTE: portabilizacion waybar
  };
}
