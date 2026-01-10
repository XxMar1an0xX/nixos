{...}: {
  #NOTE: comando de prueba es:
  # test-sddm-silent
  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      # boring = "${pkgs.gnome-backgrounds}/share/backgrounds/gnome/symbolic-d.png";
      # borng = ''/nix/store/h49hvwvgqz5dq9ahsdf1632mlssmlwpy-gnome-backgrounds-48.2.1/share/backgrounds/gnome/symbolic-d'';
      summit = "${./../../../recursos/Summit_no_resize.mp4}";
    };
    settings = {
      "LoginScreen" = {
        background = "fhffpgfd338gk8qr8l2c0iaj1nn5rn8g-Summit_no_resize.mp4";
      };
      "LockScreen" = {
        background = "fhffpgfd338gk8qr8l2c0iaj1nn5rn8g-Summit_no_resize.mp4";
      };
    };
    profileIcons = {
      ruiz = "${./../../../recursos/GoldenSlime.jpg}";
    };
  };
}
