{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.lspFeatures = {
    pkgs,
    lib,
    ...
  }: {
    config.vim = {
      lsp.servers = {
        #NOTE: simbolos en el autocomp
        lspkind.enable = true;
        # lightbulb.enable = true;
        lspsaga.enable = false;
        # trouble.enable = true;
        # lspSignature.enable = true;

        #NOTE: no anda embedded lang
        otter-nvim = {
          # enable = true;
          setupOpts = {
            lsp.handle_leading_whitespace = true;
            strip_wrapping_quote_characters = ["'" "\"" "`" "\'\'"];
          };
        };
        # nvim-docs-view.enable = true;
      };

      #NOTE: autocompletado
      autopairs.nvim-autopairs.enable = true;
      autocomplete = {
        enableSharedCmpSources = true;
        # nvim-cmp.enable = true;
        blink-cmp = {
          friendly-snippets.enable = true;
          enable = true;
          sourcePlugins = {
            ripgrep.enable = true;
            spell.enable = true;
          };
          setupOpts = {
            keymap.preset = "super-tab";
            completion.documentation.auto_show = true;
            fuzzy.implementation = "prefer_rust_with_warning";
          };
        };
      };
    };
  };
}
