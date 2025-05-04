{
  inputs,
  pkgs,
  cofig,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # settings = {
    # };
  };
}
