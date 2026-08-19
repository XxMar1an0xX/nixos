{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.extenciones = {pkgs, ...}: {
    programs.firefox = {
      policies.ExtensionSettings = {
        "*".installation_mode = "blocked";
        #NOTE: este es untrap for youtube
        "{2662ff67-b302-4363-95f3-b050218bd72c}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4403100/untrap_for_youtube-8.3.1.xpi";
          installation_mode = "force_installed";
        };
        #NOTE: este es vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "force_installed";
        };
        # "deArrow@ajay.app" = {
        #   installation_mode = "force_installed";
        # };
        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
        };
        # "addon@darkreader.org" = {
        #   installation_mode = "force_installed";
        # };
        "keepassxc-browser@keepassxc.org" = {
          installation_mode = "force_installed";
        };
        "7esoorv3@alefvanoon.anonaddy.me" = {
          installation_mode = "force_installed";
        };
      };
      profiles.ruiz.extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          sponsorblock
          darkreader
          vimium
          # untrap-for-youtube
          # dearrow
          #TODO: configurar estos
          keepassxc-browser
          libredirect
        ];

        settings = {
          #TODO: estos no van a funcionar porque usan un metodo distinto de localizar configuracion que el que usa home manager, efectivamente o es cambiar el codigo fuente o es automatizar la accion de importa configuracion
          "sponsorBlocker@ajay.app".settings = {
            # enabled = true;
            invidiousInstances = [
              "127.0.0.1"
              "inv.nadeko.net"
            ];
            supportInvidious = true;
          };
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}".settings = {
            # enabled = true;
            "searchEngines" = ''
              w: https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia
              np: https://search.nixos.org/packages?channel=unstable&query=%s Package Search
              no: https://search.nixos.org/options?channel=unstable&query=%s Nixos Options
              hm: https://home-manager-options.extranix.com/?query=%s HomeManager Options

              inv: http://127.0.0.1:3000/search?q=%s Invidious own Instance

              repo: https://github.com/XxMar1an0xX/nixos Repo Nixosa
            '';

            "settingsVersion" = "2.4.2";
          };
        };
      };
      nativeMessagingHosts = [pkgs.keepassxc];
    };
  };
}
