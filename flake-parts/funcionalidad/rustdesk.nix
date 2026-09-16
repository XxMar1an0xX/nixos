{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.rustdesk = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.services.rustdesk-client;
  in {
    options.services.rustdesk-client = {
      enable = lib.mkEnableOption "the RustDesk remote desktop client";

      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.callPackage ./../../recursos/package_rustdeska.nix {};
        defaultText = lib.literalExpression "pkgs.callPackage ./package.nix { }";
        description = "RustDesk client package to install and run.";
      };

      enableService = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Run rustdesk --service as root at boot for incoming connections.
          Leave disabled to install only the graphical client.
        '';
      };

      niri.enable = lib.mkEnableOption ''
        PipeWire and the GNOME ScreenCast portal for an existing Niri session
      '';
    };

    config = lib.mkIf cfg.enable {
      environment.systemPackages = [cfg.package];
      hardware.graphics.enable = true;

      services.pipewire.enable = lib.mkIf cfg.niri.enable true;
      security.polkit.enable = lib.mkIf cfg.niri.enable true;
      xdg.portal = lib.mkIf cfg.niri.enable {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-gnome
          pkgs.xdg-desktop-portal-gtk
        ];
        config.niri.default = lib.mkDefault ["gtk"];
        config.niri."org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
      };

      # The root service injects keyboard/mouse events through uinput on Wayland.
      boot.kernelModules = lib.mkIf cfg.enableService ["uinput"];

      security.pam.services.rustdesk = lib.mkIf cfg.enableService {};

      systemd.services.rustdesk = lib.mkIf cfg.enableService {
        description = "RustDesk remote desktop service";
        wantedBy = ["multi-user.target"];
        after = ["network.target" "systemd-user-sessions.service"];
        wants = ["network.target"];
        # Keep the NixOS setuid wrappers (sudo/pkexec) and session commands visible.
        environment = {
          PATH = lib.mkForce "/run/wrappers/bin:/run/current-system/sw/bin";
          PULSE_LATENCY_MSEC = "60";
          PIPEWIRE_LATENCY = "1024/48000";
        };
        serviceConfig = {
          Type = "simple";
          ExecStart = "${cfg.package}/bin/rustdesk --service";
          User = "root";
          KillMode = "mixed";
          TimeoutStopSec = 30;
          Restart = "on-failure";
          RestartSec = 5;
          LimitNOFILE = 100000;
        };
      };
    };
  };
}
