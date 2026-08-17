{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.bookmarks = {
    pkgs,
    lib,
    ...
  }: {
    programs.firefox.profiles.ruiz.bookmarks = {
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
          name = "invidious instance";
          url = "http://127.0.0.1:3000";
          keyword = "inv";
        }
        {
          name = "Nix Leaning";
          toolbar = true;
          bookmarks = [
            {
              name = "Nix Builtins";
              url = "https://nix.dev/manual/nix/2.25/language/builtins";
              keyword = "built";
            }
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
          keyword = "temp";
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
            {
              name = "syncthing";
              url = "http://127.0.0.1:8384/";
              keyword = "sync";
            }
            {
              name = "impresoras";
              url = "http://localhost:631/printers/";
              keyword = "cups";
            }
          ];
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
  };
}
