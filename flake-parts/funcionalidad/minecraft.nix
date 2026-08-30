{
  self,
  inputs,
  ...
}: {
  flake.homeModules.minecraft = {
    pkgs,
    config,
    ...
  }: let
    Fabulously_Optimized = pkgs.fetchurl {
      url = "https://cdn.modrinth.com/data/1KVo5zza/versions/K0lc692U/Fabulously.Optimized-v13.3.0-mr.1.mrpack?mr_download_reason=standalone&mr_game_version=1.21.11";
      hash = "sha256-s+aqYKfQHu3mvcMkoSQ8b4nuvdXCL5rsXP/wRLgP9OI=";
    };
  in {
    imports = [
      # Import the nixcraft home module
      inputs.nixcraft.homeModules.default
    ];
    nixcraft = {
      enable = true;

      client = {
        # Config to share with all instances
        shared = {
          # Symlink screenshots dir from all instances
          files."screenshots".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Pictures";

          # Common account
          account = {
            username = "Xx_Mar1an0_xX";
            # uuid = "2909ee95-d459-40c4-bcbb-65a0cc413110";
            offline = true;
          };

          useDiscreteGPU = true; # Enabled by default

          # Game is passed to the gpu (set if you have nvidia gpu)
          # enableNvidiaOffload = true; # Enabled by default

          # envVars = {
          #   # Fixes bug with nvidia (applied by default)
          #   __GL_THREADED_OPTIMIZATIONS = "0";
          # };

          binEntry.enable = true;
        };
        instances = {
          minecraft = {
            enable = true;
            # version = "1.21.11";

            # Add a desktop entry
            mrpack = {
              enable = true;
              file = Fabulously_Optimized;
            };
            files = {
              "mods/DistantHorizons-3.2.0-b.jar".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uCdwusMi/versions/bCTilxSz/DistantHorizons-3.2.0-b-1.21.11-fabric-neoforge.jar?mr_download_reason=standalone";
                hash = "sha256-kJqiKCZoxbkF8gmd9iEAWFMzNVsm6+gFPVmi1QVNu7U=";
              };
              "options.txt" = {
                source = ./../../recursos/options.txt;
              };
              "shaderpacks/SolasShader.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/EpQFjzrQ/versions/KcfQaN5J/Solas%20Shader%20V3.7b.zip?mr_download_reason=standalone";
                hash = "sha256-t9/kxzU9Z3qSzEyGuHvAYz8QFDBdknympILDA0J7+CU=";
              };
              "shaderpacks/FantasyShader.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/l6di6hYz/versions/kqFlgfIA/Fantasy%20Shaders%20Reimagined%20v1.1.zip?mr_download_reason=standalone";
                hash = "sha256-i2RyzAnct4ItLGuMfrylBIdI4fURIlEfhpWQiN6IxnE=";
              };
              "resourcepacks/Fresh-Animations.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/50dA9Sha/versions/xN57JJts/FreshAnimations_v1.10.4.zip?mr_download_reason=standalone";
                hash = "sha256-jkSylWDS59lSwKT3fwRR5tywSPgnGJv/xxK0Rr6N5/I=";
              };
              "resourcepacks/Dark-mode.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/6SLU7tS5/versions/sPDc9hXF/Default-Dark-Mode-1.21.11-2026.4.0.zip?mr_download_reason=standalone";
                hash = "sha256-0xAQDKHGgaEg9Yv0WOJbE10fk6P19qtY/N1rO2kAbtU=";
              };
              "resourcepacks/enchant-icons-1.21.11-v1.3.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/6vhHOIKw/versions/vInzMXvx/enchant-icons-1.21.11-v1.3.zip?mr_download_reason=standalone";
                hash = "sha256-GN5HHTXVKrYWZUOjiHLf/t4AiLiO2HA3lJUadPpxrpk=";
              };
            };
            # waywall can be enabled
            # waywall.enable = true;

            # Add executable to path
            # binEntry = {
            #   enable = true;
            #   # Set executable name
            #   name = "Fabulously Optimized";
            # };

            desktopEntry = {
              enable = true;
              name = "Minecraft";
              extraConfig = {
                # TODO: fix icons not working
                # icon = "${inputs.self}/assets/minecraft/dirt.svg";
                # terminal = true;
              };
            };
            _classSettings = {
              fullscreen = true;
            };
          };
        };
      };
    };
  };
}
