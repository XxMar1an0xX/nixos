{
  self,
  inputs,
  ...
}: {
  flake.homeModules.new = {
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
