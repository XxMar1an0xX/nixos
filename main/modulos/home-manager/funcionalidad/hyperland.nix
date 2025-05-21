{
  inputs,
  pkgs,
  cofig,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # settings = {
    # };
  };
}
