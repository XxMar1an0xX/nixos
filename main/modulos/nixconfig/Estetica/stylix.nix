{
  lib,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/sparky.yaml";
    base16Scheme = {
      scheme = "nordfox";
      author = "EdenEast";
      base00 = "2e3440";
      base01 = "39404f";
      base02 = "444c5e";
      base03 = "465780";
      base04 = "7e8188";
      base05 = "cdcecf";
      base06 = "abb1bb";
      base07 = "e7ecf4";
      base08 = "bf616a";
      base09 = "c9826b";
      base0A = "ebcb8b";
      base0B = "a3be8c";
      base0C = "88c0d0";
      base0D = "81a1c1";
      base0E = "b48ead";
      base0F = "bf88bc";
    };
    cursor = {
      # name = "Nordzy-hyprcursors";
      # package = pkgs.nordzy-cursor-theme;
      size = 25;
      package = pkgs.quintom-cursor-theme;
      name = "Quintom_Snow";
    };
    image = ./Wallpapers/wallpaperflare.com_wallpaper.jpg;
    imageScalingMode = "fill";
    polarity = "dark";
    targets = {
      nixvim.enable = false;
      grub.enable = false;
      # hyprland = {
      #   enable = true;
      #   hyprpaper.enable = true;
      # };
    };
  };
}
