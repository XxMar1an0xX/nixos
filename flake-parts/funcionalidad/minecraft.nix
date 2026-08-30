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

          # binEntry.enable = true;
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
                hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
              };
              "options.txt" = {
                source = ./../../recursos/options.txt;
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
