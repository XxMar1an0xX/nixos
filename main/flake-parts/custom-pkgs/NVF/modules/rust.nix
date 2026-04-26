{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.rust = {
    pkgs,
    lib,
    ...
  }: {
    config.vim = {
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        rust = {
          enable = true;
          extensions.crates-nvim = {
            enable = true;
            # codeActions = true;
          };
          dap.enable = true;
          format.enable = true;
          lsp = {
            enable = true;
            # opts = ''
            #    ['rust-analyzer'] = {
            #     cargo = {allFeature = true},
            #     checkOnSave = true,
            #     procMacro = {
            #       enable = true,
            #     },
            #   },
            # '';
          };
          treesitter.enable = true;
        };
      };
    };
  };
}
