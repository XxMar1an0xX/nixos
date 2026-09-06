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
              # "mods/entity_texture_features.jar" = {
              #   # method = "copy";
              #   # force = true;
              #   source = pkgs.fetchurl {
              #     url = "https://cdn.modrinth.com/data/BVzZfTc1/versions/rAQimlSn/entity_texture_features_1.21.11-fabric-7.1.jar?mr_download_reason=standalone";
              #     hash = "sha256-fBpwdmsxI462NqVJe58MnCYNXtlMCTTEz9EbmmhUra8=";
              #   };
              # };
              # "mods/entity_model_features.jar" = {
              #   # method = "copy";
              #   # force = true;
              #   source = pkgs.fetchurl {
              #     url = "https://cdn.modrinth.com/data/4I1XuqiY/versions/CWZPvNbk/entity_model_features-3.2.4-1.21.11-fabric.jar?mr_download_reason=standalone&mr_game_version=1.21.11";
              #     hash = "sha256-+/YbJjbi/91iIg/u4jH1r4gctwgP3VGAkk+ceDwFhK4=";
              #   };
              # };
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
              "mods/Veinminer.jar" = {
                method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/OhduvhIc/versions/7c3RO0Qs/veinminer-fabric-2.11.2%2B1.21.11.jar?mr_download_reason=standalone";
                  hash = "sha256-ubLLSS+/VtNcg99EUmjTE0eAywtR4P/LQIWgqRqp1Wk=";
                };
              };
              "mods/Clientcommands.jar" = {
                method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/7Coz83fv/versions/eKkGy7fT/clientcommands-2.13.2.jar?mr_download_reason=standalone";
                  hash = "sha256-EjW87wbOxpSHs3pk+vIEJ7+HvmT6J8Bf+nHL+bJWvyI=";
                };
              };

              "mods/Enchantment-cracker.jar" = {
                method = "copy";
                # force = true;
                source =
                  pkgs.fetchzip {
                    url = "https://github.com/Earthcomputer/EnchantmentCracker/releases/download/v1.9/enchcracker-1.9.zip";
                    hash = "sha256-34ff9OAsLA14YYHt9udovoDP/mTD82OB4ChtW6xKgMM=";
                  }
                  + "/lib/enchcracker-1.9.jar";
              };

              "mods/Litematica.jar" = {
                method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/bEpr0Arc/versions/K0yRfp9V/litematica-fabric-1.21.11-0.26.14.jar?mr_download_reason=standalone";
                  hash = "sha256-JCkxjpf27nCNUOWFxZIxvqdSHAnbdfL7MgtCr0gMzTM=";
                };
              };
              "mods/REI.jar" = {
                method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/nfn13YXA/versions/QEiKPzyl/RoughlyEnoughItems-21.11.816-fabric.jar?mr_download_reason=standalone";
                  hash = "sha256-yUCjxhDe6xsGPWvMMnCf3t83FInVBLKe8FD+c4il+Ow=";
                };
              };
              "mods/Xaeros.jar" = {
                method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/1bokaNcj/versions/8MdqDp18/xaerominimap-fabric-1.21.11-26.4.2.jar?mr_download_reason=standalone";
                  hash = "sha256-HTJw6ErBDeEB8LuAc3GXK7yOzOqR+5v966zR7J82pGc=";
                };
              };
              "mods/Malilib.jar" = {
                method = "copy";
                # force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/GcWjdA9I/versions/lSZtYs2h/malilib-fabric-1.21.11-0.27.19.jar?mr_download_reason=standalone";
                  hash = "sha256-KHGfG9KW7DP2yjqfIveSPSwYbBoxkaChTxiJNI1C118=";
                };
              };

              #NOTE: opciones de minecraft
              "options.txt" = {
                source = ./../../recursos/options.txt;
                method = "copy";
                force = true;
              };
              "quickskin/uploads/skins/XChara.png" = {
                # method = "copy";
                source = ./../../recursos/my_skin.png;
                force = true;
              };

              "quickskin/uploads/capes/Epic!.png" = {
                # method = "copy";
                source = ./../../recursos/cape.png;
                force = true;
              };
              "config/skinlayers.json" = {
                method = "copy";
                source = ./../../recursos/skinlayers.json;
                force = true;
              };
              "config/waveycapes.json" = {
                method = "copy";
                source = ./../../recursos/waveycapes.json;
                force = true;
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
              "resourcepacks/Glowing-armor.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/WkLr6o3M/versions/cw5mvQiP/Glowing%203D%20Armor.zip?mr_download_reason=standalone";
                  hash = "sha256-0tr8IU5fg1XT57E8UfMsmOGkDBH6IP3RdwV1pdJP0Gk=";
                };
              };
              "resourcepacks/3d-blocks.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/5048Qu03/versions/IKDr9x0v/%C2%A7f%C2%A7lActually%20%C2%A76%C2%A7l3D%20%C2%A7fBlocks%20%26%20Items%21%C2%A77.zip?mr_download_reason=standalone";
                  hash = "sha256-DfIvmE5i9MnSUTLlIQPiAZcaW6XCru0JGk2w2LDDDYg=";
                };
              };
              "resourcepacks/Fabolous3D-Tools.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/Yr3ZcqyB/versions/7AWjQDPi/Fabulous%20Enchanetd%203D%20%28compat%29.zip?mr_download_reason=standalone";
                  hash = "sha256-NVK53NSleQJRThj8Y6mf6V8Ou51asTfnDpTuGmJODSA=";
                };
              };
              "resourcepacks/3D-Trident.zip" = {
                method = "copy";
                force = true;
                source = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/r6fvlh3S/versions/t9d1ITw8/rainbow%60s%20Trident.zip?mr_download_reason=standalone";
                  hash = "sha256-3qhI+lQN1uWBNx4uivTm+MVV8AVPy/TD6KxCJPYTssU=";
                };
              };
            };
            java = {
              extraArguments = [
                "-XX:+UseShenandoahGC"
                "-XX:+AlwaysPreTouch"
              ];
              maxMemory = 4000;
              minMemory = 4000;
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
