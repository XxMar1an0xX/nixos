{
  pkgs,
  inputs,
  CondicionalPortable,
  ...
}: let
  foxconfig = {
    ruiz = {
      search = {
        force = true;
        order = ["Startpage" "Nix Packages" "Home-Manager"];
        privateDefault = "Startpage";
        engines = {
          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
          "Startpage" = {
            urls = [
              {
                template = "https://www.startpage.com/sp/search?q={searchTerms}";
              }
            ];
            icon = "https://design.system1.com/wp-content/uploads/2023/02/startpage-icon.svg";
          };
          "Home-Manager" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-25.05";
              }
            ];
            icon = "https://avatars.githubusercontent.com/u/33221035?s=48&v=4";
            definedAliases = ["@hm"];
          };
        };
        default = "Startpage";
      };
      extensions = {
        packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          sponsorblock
          darkreader
          vimium
          ublock-origin
          # untrap-for-youtube
          dearrow
          #TODO: configurar estos
          leechblock-ng
          keepassxc-browser
        ];
        settings = {
          "uBlock0@raymondhill.net".settings = {
            enabled = true;
            selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-quick-fixes"
              "user-filters"
              "easylist"
              "adguard-generic"
              "easyprivacy"
              "LegitimateURLShortener"
              "adguard-spyware-url"
              "block-lan"
              "urlhaus-1"
              "curben-phishing"
              "plowe-0"
              "fanboy-cookiemonster"
              "ublock-cookies-easylist"
              "adguard-cookies"
              "ublock-cookies-adguard"
              "easylist-chat"
              "easylist-newsletters"
              "easylist-notifications"
              "easylist-annoyances"
              "adguard-mobile-app-banners"
              "adguard-other-annoyances"
              "adguard-popup-overlays"
              "adguard-widgets"
              "ublock-annoyances"
              "spa-1"
              "spa-0"
              # "https://filters.adtidy.org/extension/ublock/filters/3.txt"
            ];
          };
        };
        force = true;
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.update.autoUpdateDefault" = false;
        "app.normandy.first_run" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.bookmarks.addedImportButton" = false;
        "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "lunar-eclipse";
        "media.ffmpeg.vaapi.enabled" = true;
        "widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes
        "privacy.webrtc.legacyGlobalIndicator" = false;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.contentblocking.category" = "strict";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "DisableSystemAddonUpdate" = false;
        "app.shield.optoutstudies.enabled" = false;
        "extensions.update.enabled" = false;
        "extensions.webcompat.enable_picture_in_picture_overrides" = true;
        "extensions.webcompat.enable_shims" = true;
        "extensions.webcompat.perform_injections" = true;
        "extensions.webcompat.perform_ua_overrides" = true;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;

        # Disable irritating first-run stuff
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.feeds.showFirstRunUI" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.rights.3.shown" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.uitour.enabled" = false;
        "startup.homepage_override_url" = "";
        "trailhead.firstrun.didSeeAboutWelcome" = true;
        "identity.fxaccounts.enabled" = false;

        #NOTE: para el tema de firefox
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "layout.css.backdrop-filter.enabled" = true;
        "svg.context-properties.content.enabled" = true;

        #NOTE: opciones de librewolf
      };
      # extraConfig = ''
      #   user_pref("extensions.autoDisableScopes", 0);
      #   user_pref("extensions.enabledScopes", 15);
      # '';
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Self-Managed-Life";
            # toolbar = true;
            url = "https://wiki.futo.org/index.php/Introduction_to_a_Self_Managed_Life:_a_13_hour_%26_28_minute_presentation_by_FUTO_software";
          }
          {
            name = "Nix Config Repo";
            url = "https://github.com/XxMar1an0xX/nixos";
            keyword = "repo";
          }
          {
            name = "Nix Leaning";
            toolbar = true;
            bookmarks = [
              {
                name = "Flake Anatomy";
                url = "https://vtimofeenko.com/posts/practical-nix-flake-anatomy-a-guided-tour-of-flake.nix/";
                keyword = "flake";
              }
              {
                name = "Nixpkgs";
                url = "https://search.nixos.org/packages";
                keyword = "nix";
              }
              {
                name = "NVF Config";
                url = "https://notashelf.github.io/nvf/options.html";
                keyword = "nvf";
              }
              {
                name = "Stylix Config";
                url = "https://nix-community.github.io/stylix/";
                keyword = "stylix";
              }
            ];
          }
          {
            name = "Temporizador";
            url = "https://reloj-alarma.es/temporizador/#countdown=00:30:00&enabled=0&seconds=1800&title=Temporizador&sound=xylophone&loop=1";
          }
          {
            name = "Youtube Channels";
            bookmarks = [
              {
                name = "Economia";
                url = "https://www.youtube.com/@MentisWave/videos";
              }
              {
                name = "Software Explicado";
                url = "https://www.youtube.com/@CoreDumpped";
              }
              {
                name = "Viejo Hardware";
                url = "https://www.youtube.com/@Ionic1k/videos";
              }
              {
                name = "Todo desde 0";
                url = "https://www.youtube.com/@AstroSamDev/videos";
              }
              {
                name = "Buen Fondo";
                url = "https://www.youtube.com/@detrasdelenimga";
              }
              {
                name = "Minecraft Comandos al Limite";
                url = "https://www.youtube.com/@heledron/videos";
              }
              {
                name = "Buenos proyectos y Electronica";
                url = "https://www.youtube.com/@engineerbo/videos";
              }
              {
                name = "DIY microfono";
                url = "https://www.youtube.com/watch?v=LoQu3XXIayc";
              }
              {
                name = "Procedural generator";
                url = "https://www.youtube.com/@dvgen";
              }
              {
                name = "Buena Explicacion Fisica";
                url = "https://www.youtube.com/@MAKiTHappen/videos";
              }
              {
                name = "Trading sim?";
                url = "https://www.youtube.com/@Krafer";
              }
              {
                name = "Carpinteria Tips";
                url = "https://www.youtube.com/@fiveduckstudio/videos";
              }
              {
                name = "Consejos Generales Utiles";
                url = "https://www.youtube.com/@Tako_Balls/videos";
              }
              {
                name = "Airsoft Dream";
                url = "https://www.youtube.com/@SiloEntertainment";
              }
              {
                name = "Canal Argentino";
                url = "https://www.youtube.com/@tossini";
              }
              {
                name = "Electronica y Low Level practica";
                url = "https://www.youtube.com/@BenEater/videos";
              }
              {
                name = "ElectroBoom";
                url = "https://www.youtube.com/@ElectroBOOM";
                keyword = "boom";
              }
            ];
          }
          {
            name = "CUPS-Impresora";
            url = "http://localhost:631/printers/epsonL4150";
            keyword = "impr";
          }
          {
            name = "Recursos Utiles";
            bookmarks = [
              {
                name = "MP4 a webp";
                url = "https://webp-conv.pages.dev/";
              }
              {
                name = "Firefox-CSS";
                url = "https://firefoxcss-store.github.io/#";
                keyword = "fcss";
              }
              {
                name = "Anteojos";
                keyword = "zenni";
                url = "https://www.zennioptical.com/b/all-men-glasses?filter=prod_secondary_shape:Rectangle";
              }
              {
                name = "USB ranking";
                url = "https://ssd-tester.com/usb_flash_drive_test.php?sort=512+GB";
                keyword = "usb";
              }
              {
                name = "FreeCAD Planos";
                url = "https://github.com/berserkdesign/Practices-with-FreeCAD/tree/master/Basic%20practices%20with%20FreeCAD/Temporada%202";
                keyword = "freecad";
              }
              {
                name = "Ropa inicio";
                url = "https://www.putthison.com/start-here/";
                keyword = "ropa";
              }
              {
                name = "Mouse";
                url = "https://www.reddit.com/r/coolguides/comments/1dfoxva/a_cool_guide_on_how_to_choose_a_mouse_based_on/";
                keyword = "mouse";
              }
              {
                name = "Bevy";
                url = "https://bevy.org/learn/quick-start/introduction/";
                keyword = "bevy";
              }
              {
                name = "Hyprland";
                url = "https://wiki.hypr.land/Configuring/Variables/";
                keyword = "hypr";
              }
              {
                name = "Dev Roadmap";
                url = "https://roadmap.sh/";
                keyword = "road";
              }
              {
                name = "AutoEQ";
                url = "https://autoeq.app/";
                keyword = "eq";
              }
              {
                name = "Correo Argentino";
                url = "https://epago.correoargentino.com.ar/#/login";
                keyword = "correo";
              }
            ];
          }
        ];
      };

      userContent = builtins.readFile "${
        (
          pkgs.fetchFromGitHub {
            owner = "AnhNguyenlost13";
            repo = "GlassyFox";
            rev = "c593e6851cd4fa6d977461aa46e25ee731802f10";
            hash = "sha256-svOixBi2MbTxEAx7CDZWNYesYfUFvnckv1BBoogmFMk=";
          }
        )
      }/userContent.css";
    };
  };
in {
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "{2662ff67-b302-4363-95f3-b050218bd72c}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4403100/untrap_for_youtube-8.3.1.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          # install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "force_installed";
        };
        "deArrow@ajay.app" = {
          installation_mode = "force_installed";
        };
        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          installation_mode = "force_installed";
        };
        "keepassxc-browser@keepassxc.org" = {
          installation_mode = "force_installed";
        };
        "leechblockng@proginosko.com" = {
          installation_mode = "force_installed";
        };
      };
    };
    profiles = foxconfig;
  };

  programs.librewolf = {
    enable = true;
    languagePacks = ["es-AR"];

    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "{2662ff67-b302-4363-95f3-b050218bd72c}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4403100/untrap_for_youtube-8.3.1.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          # install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "force_installed";
        };
        "deArrow@ajay.app" = {
          installation_mode = "force_installed";
        };
        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          installation_mode = "force_installed";
        };
        "keepassxc-browser@keepassxc.org" = {
          installation_mode = "force_installed";
        };
      };
    };
    profiles = foxconfig;
  };
}
