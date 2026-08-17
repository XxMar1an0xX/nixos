{
  self,
  inputs,
  ...
}: {
  flake.modules.firefox.extenciones = {pkgs, ...}: {
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
          settings = {
            "sponsorBlocker@ajay.app".settings = {
              enables = true;
              invidiousInstances = ["127.0.0.1"];
            };
          };
        };
      };
      nativeMessagingHosts = [pkgs.keepassxc];
    };
  };
}
