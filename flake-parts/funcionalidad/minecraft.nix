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
              #NOTE: mods
              "mods/DistantHorizons-3.2.0-b.jar".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uCdwusMi/versions/bCTilxSz/DistantHorizons-3.2.0-b-1.21.11-fabric-neoforge.jar?mr_download_reason=standalone";
                hash = "sha256-kJqiKCZoxbkF8gmd9iEAWFMzNVsm6+gFPVmi1QVNu7U=";
              };
              "mods/entity_texture_features.jar" = {
                # method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/BVzZfTc1/versions/rAQimlSn/entity_texture_features_1.21.11-fabric-7.1.jar?mr_download_reason=standalone";
                  hash = "sha256-fBpwdmsxI462NqVJe58MnCYNXtlMCTTEz9EbmmhUra8=";
                };
              };
              "mods/entity_model_features.jar" = {
                # method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/4I1XuqiY/versions/CWZPvNbk/entity_model_features-3.2.4-1.21.11-fabric.jar?mr_download_reason=standalone&mr_game_version=1.21.11";
                  hash = "sha256-+/YbJjbi/91iIg/u4jH1r4gctwgP3VGAkk+ceDwFhK4=";
                };
              };
              "mods/3d-player-skin.jar" = {
                # method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/zV5r3pPn/versions/3kCdl1bI/skinlayers3d-fabric-1.11.2-mc1.21.11.jar?mr_download_reason=standalone&mr_game_version=1.21.11";
                  hash = "sha256-MSQ+4It2s9q3HXdhlj8xcSXFNva4mEeV57AoEbT4Dpc=";
                };
              };
              "mods/Wavey-capes.jar" = {
                # method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/kYuIpRLv/versions/uaAD86JW/waveycapes-fabric-1.10.2-mc1.21.11.jar?mr_download_reason=standalone&mr_game_version=1.21.11";
                  hash = "sha256-M4YSau5Y7rgSkgdO2IlEz2Jgeli12gT32IkK2v8D4qw=";
                };
              };
              "mods/Local-Skins.jar" = {
                # method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/zAIE84Ch/versions/jfkMQkky/Quick%20Skin%20-%20Fabric%20-%201.21.11-2.6.2.5.jar?mr_download_reason=standalone";
                  hash = "sha256-M0OWwZFN48LzJ4popUoj/G6go7Tx7Q/LBNbj7qx4o6o=";
                };
              };
              "mods/Architectury.jar" = {
                # method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/lhGA9TYQ/versions/uNdfrcQ8/architectury-19.0.1-fabric.jar?mr_download_reason=standalone&mr_game_version=1.21.11";
                  hash = "sha256-ZhOV1vC+8NOnlOLbdN9WAMc4e6b7lGsXIxWXcgGmZ8c=";
                };
              };

              #NOTE: opciones de minecraft
              "options.txt" = {
                source = ./../../recursos/options.txt;
                method = "copy";
              };

              #NOTE: shaders
              "shaderpacks/SolasShader.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/EpQFjzrQ/versions/KcfQaN5J/Solas%20Shader%20V3.7b.zip?mr_download_reason=standalone";
                hash = "sha256-t9/kxzU9Z3qSzEyGuHvAYz8QFDBdknympILDA0J7+CU=";
              };
              "shaderpacks/FantasyShader.zip".source = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/l6di6hYz/versions/kqFlgfIA/Fantasy%20Shaders%20Reimagined%20v1.1.zip?mr_download_reason=standalone";
                hash = "sha256-i2RyzAnct4ItLGuMfrylBIdI4fURIlEfhpWQiN6IxnE=";
              };

              #NOTE: paquetes de recursos
              "resourcepacks/Fresh-Animations.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/50dA9Sha/versions/xN57JJts/FreshAnimations_v1.10.4.zip?mr_download_reason=standalone";
                  hash = "sha256-jkSylWDS59lSwKT3fwRR5tywSPgnGJv/xxK0Rr6N5/I=";
                };
              };
              "resourcepacks/Dark-mode.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/6SLU7tS5/versions/sPDc9hXF/Default-Dark-Mode-1.21.11-2026.4.0.zip?mr_download_reason=standalone";
                  hash = "sha256-0xAQDKHGgaEg9Yv0WOJbE10fk6P19qtY/N1rO2kAbtU=";
                };
              };
              "resourcepacks/Icons.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/O7z3QKAG/versions/RNni6iXH/Icons%20v.1.13.4.zip?mr_download_reason=standalone";
                  hash = "sha256-eeTCIhuFcWCG2smfqfh8D4ilwyXYcMrKnns6xKS/AcU=";
                };
              };
              "resourcepacks/low-fire.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/1jZGHJ05/versions/RP4ozzMC/Low%20Fire.zip?mr_download_reason=standalone";
                  hash = "sha256-p2HwChdr4rCawSjlue6p9wx0IBfe0S+ymzWD1wRjGTs=";
                };
              };
              "resourcepacks/faithful32.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/w0TnApzs/versions/WpkfQiw9/Faithful%2032x%20-%201.21.11.zip?mr_download_reason=standalone";
                  hash = "sha256-0mnNTu0Fo13y3bDcUeMQpuEj2l3oXAqDjbCah2NihcM=";
                };
              };
              "resourcepacks/Fresh-Animations+player-extension.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/E6UMWeLX/versions/4nucOSHc/FA%2BPlayer_Expressions-v1.2.zip?mr_download_reason=standalone";
                  hash = "sha256-13rpPcI8hwpM5xiqQiD71xGIfTjnjp2MWYPJ5p/kUmY=";
                };
              };
              "resourcepacks/Player-Animations.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/TAIMVZCL/versions/Wj7NeGjP/FA%2BPlayer-v1.1.zip?mr_download_reason=standalone";
                  hash = "sha256-nuOuWy/lzZgOQEFCncZtiCQ/XyQg4oFOU2HHRq2TfzM=";
                };
              };
              "resourcepacks/better-enchants.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/6udpuGCH/versions/scd0ojNG/EvenBetterEnchants_v3_1.21.5%2B.zip?mr_download_reason=standalone";
                  hash = "sha256-ERsJSB3C4RU/i9rlMPvgrjAoET/vFU5Gq0POr+eRDcg=";
                };
              };
              "resourcepacks/cubic-moon-sun.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/g4bSYbrU/versions/zHa4qeKn/cubic-sun-moon-v1.8.5.zip?mr_download_reason=standalone";
                  hash = "sha256-w3EqO6UR01IB1EuvzhbJ025xhdZ0OqsCIHvaDV0Qnt4=";
                };
              };
              "resourcepacks/player-eyes-animation.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/vPaHlT2U/versions/ZNXAMRW4/JustExpressions_v1.2.1.zip?mr_download_reason=standalone";
                  hash = "sha256-M0g64+YUmqo1PA1HKvx8j9wyMsDnFGZuJGue+3pDqsU=";
                };
              };

              "quickskin/uploads/skins/XChara.png" = {source = ./../../recursos/my_skin.png;};
              "quickskin/uploads/capes/Epic!.png".source = ./../../recursos/cape.png;
              "config/skinlayers.json".source = ./../../recursos/skinlayers.json;
              "config/waveycapes.json".source = ./../../recursos/waveycapes.json;
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
