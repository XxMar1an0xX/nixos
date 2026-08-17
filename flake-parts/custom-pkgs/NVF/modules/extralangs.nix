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
        enableFormat = true;
        enableTreesitter = true;
        #NOTE: lenguajes extras
        clang.enable = true;
        lua.enable = true;
        markdown.enable = true;
        python.enable = true;
        bash = {
          enable = true;
          format.enable = true;
          treesitter.enable = true;
        };
        yaml.enable = true;
        json.enable = true;
      };
    };
  };
}
