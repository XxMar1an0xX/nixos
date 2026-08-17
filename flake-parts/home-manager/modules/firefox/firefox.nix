{
  self,
  inputs,
  ...
}: {
  flake.homeModules.firefox = {
    pkgs,
    inputs,
    ...
  }: {
    modules = [
      {_class = "firefox";}
      self.modules.firefox.bookmarks
      self.modules.firefox.engines
      self.modules.firefox.extenciones
      self.modules.firefox.leechblock
      self.modules.firefox.ublock
    ];
    programs.firefox = {
      enable = true;
      profiles = {
        ruiz = {
          extensions.force = true;
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
            "services.sync.engine.passwords" = false;

            "extensions.screenshots.disabled" = true;
            "browser.topsites.contile.enabled" = false;
            "browser.formfill.enable" = false;
            "browser.search.suggest.enabled" = false;
            "browser.search.suggest.enabled.private" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.showSearchSuggestionsFirst" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.feeds.snippets" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.system.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "privacy.donottrackheader.enabled" = true;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.partition.network_state.ocsp_cache" = true;
            "experiments.activeExperiment" = false;
            "experiments.enabled" = false;
            "experiments.supported" = false;
            "network.allow-experiments" = false;

            # Disable irritating first-run stuff
            "browser.translations.automaticallyPopup" = false;
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
            "extensions.pocket.api" = "";
            "extensions.pocket.oAuthConsumerKey" = "";
            "extensions.pocket.showHome" = false;
            "extensions.pocket.site" = "";

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
    };
  };
}
