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
      settings = {
        user.name = "XxMar1an0xX";
        user.email = "frodoepifanio@prptonmail.com";
      };
      enable = true;
    };
  };
}
