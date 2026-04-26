{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.extraLangs = {
    pkgs,
    lib,
    ...
  }: {
    config.vim = {
      languages = {
        #NOTE: lenguajes extras
        clang.enable = true;
        lua.enable = true;
        markdown.enable = true;
        python.enable = true;
        bash = {
          enable = true;
          format.enable = true;
        };
      };
    };
  };
}
