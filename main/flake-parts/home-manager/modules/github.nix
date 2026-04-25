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
      enable = true;
    };
  };
}
