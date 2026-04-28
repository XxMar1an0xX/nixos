{
  self,
  inputs,
  ...
}: {
  flake.homeModules.github = {
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
    programs.git = {
      #TODO: setup sops/nix secrets fpr git autologin
      userName = "XxMar1an0xX";
      userEmail = "frodoepifanio@prptonmail.com";
      enable = true;
    };
  };
}
