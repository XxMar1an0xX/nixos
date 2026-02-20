{pkgs, ...}: {
  #NOTE: roblox

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
  # systemd.services.flatpak-repo = {
  #   wantedBy = ["multi-user.target"];
  #   path = [pkgs.flatpak];
  #   script = ''flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo     '';
  # };
}
