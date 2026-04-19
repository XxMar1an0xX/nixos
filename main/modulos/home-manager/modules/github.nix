{
  self,
  inputs,
  ...
}: {
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
  programs.git = {
    enable = true;
  };
}
