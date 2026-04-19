{
  self,
  inputs,
  ...
}: {
  flake.homeManagerModules.github = {
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
