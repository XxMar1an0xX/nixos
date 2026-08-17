{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.leechblock = {
    pkgs,
    lib,
    ...
  }: {
    programs.firefox = {
      policies.ExtensionSettings = {
        "*".installation_mode = "blocked";
        "leechblockng@proginosko.com" = {
          installation_mode = "force_installed";
        };
      };
      profiles.ruiz.extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          leechblock-ng
        ];
        settings."leechblockng@proginosko.com".settings = {
          "setName1" = "Youtube Addiccion";
          "sites1" = "www.youtube.com";
          "times1" = "0000-2400";
          "limitMins1" = "60";
          "limitperiod1" = "";
          "limitoffset1" = "";
          "rollover1" = false;
          "conjmode1" = false;
          "days1" = [
            false
            true
            true
            true
            true
            true
            true
          ];
          "blockurl1" = "blocked.html?$s&$u";
          "passwordrequire1" = "0";
          "passwordsetspec1" = "";
          "customMsg1" = "Solo aguanda 1 semanita";
          "incogmode1" = "0";
          "applyfilter1" = false;
          "filtername1" = "grayscale";
          "filtermute1" = false;
          "closetab1" = false;
          "activeBlock1" = true;
          "countfocus1" = true;
          "countaudio1" = false;
          "showkeyword1" = true;
          "titleonly1" = false;
          "delayfirst1" = true;
          "delaysecs1" = "60";
          "delayallowmins1" = "";
          "delayautoload1" = true;
          "delaycancel1" = true;
          "reloadsecs1" = "";
          "addhistory1" = false;
          "allowoverride1" = false;
          "allowoverlock1" = true;
          "prevopts1" = false;
          "prevgenopts1" = false;
          "prevaddons1" = false;
          "prevsupport1" = false;
          "prevdebugging1" = false;
          "prevoverride1" = false;
          "disable1" = false;
          "showtimer1" = true;
          "allowrefers1" = false;
          "allowkeywords1" = false;
          "waitsecs1" = "";
          "sitesurl1" = "";
          "regexpblock1" = "";
          "regexpallow1" = "";
          "ignorehash1" = true;
          "setname2" = "ajsdhjdaskj";
          "sites2" = "";
          "times2" = "";
          "limitmins2" = "";
          "limitperiod2" = "";
          "limitoffset2" = "";
          "rollover2" = false;
          "conjmode2" = false;
          "days2" = [
            false
            true
            true
            true
            true
            true
            false
          ];
          "blockurl2" = "blocked.html?$s&$u";
          "passwordrequire2" = "0";
          "passwordsetspec2" = "";
          "custommsg2" = "";
          "incogmode2" = "0";
          "applyfilter2" = false;
          "filtername2" = "grayscale";
          "filtermute2" = false;
          "closetab2" = false;
          "activeblock2" = false;
          "countfocus2" = true;
          "countaudio2" = false;
          "showkeyword2" = true;
          "titleonly2" = false;
          "delayfirst2" = true;
          "delaysecs2" = "60";
          "delayallowmins2" = "";
          "delayautoload2" = true;
          "delaycancel2" = true;
          "reloadsecs2" = "";
          "addhistory2" = false;
          "allowoverride2" = false;
          "allowoverlock2" = true;
          "prevopts2" = false;
          "prevgenopts2" = false;
          "prevaddons2" = false;
          "prevsupport2" = false;
          "prevdebugging2" = false;
          "prevoverride2" = false;
          "disable2" = false;
          "showtimer2" = true;
          "allowrefers2" = false;
          "allowkeywords2" = false;
          "waitsecs2" = "";
          "sitesurl2" = "";
          "regexpblock2" = "";
          "regexpallow2" = "";
          "ignorehash2" = true;
          "numSets" = "2";
          "sync" = false;
          "theme" = "";
          "customstyle" = "";
          "oa" = "0";
          "hpp" = true;
          "apt" = "";
          "timervisible" = true;
          "timersize" = "1";
          "timerlocation" = "0";
          "timerbadge" = true;
          "orm" = "";
          "orln" = "";
          "orlp" = "";
          "ora" = "0";
          "orcode" = "";
          "orc" = true;
          "warnsecs" = "";
          "warnimmediate" = true;
          "contextmenu" = true;
          "matchSubdomains" = true;
          "disablelink" = false;
          "clocktimeformat" = "0";
          "savesecs" = "10";
          "clockoffset" = "";
          "ignorejumpsecs" = "";
          "allfocused" = false;
          "usedocfocus" = true;
          "processtabssecs" = "1";
          "processactivetabs" = false;
          "accesscodeimage" = false;
          "allowlbwebsite" = true;
          "diagmode" = false;
          "exportpasswords" = false;
          "autoexportsync" = true;
        };
      };
    };
  };
}
