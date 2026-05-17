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
        # lspkind.enable = true;
        # lightbulb.enable = true;
        # lspsaga.enable = false;
        # trouble.enable = true;
        # lspSignature.enable = true;

        #NOTE: no anda embedded lang
        otter-nvim = {
          enable = true;
          mappings.toggle = true;
          setupOpts = {
            handle_leading_whitespace = true;
            strip_wrapping_quote_characters = ["'" "\"" "`" "\'\'"];
          };
        };
        # nvim-docs-view.enable = true;
      };
      formatter.conform-nvim = {
        enable = true;
        setupOpts = {
          formatters_by_ft = {
            # lua = lib.generators.mkLuaInline ''{"prettierd", "injected"}'';
            # rust = lib.generators.mkLuaInline ''{ "injected", lsp_format = "last" }'';
            # bash = lib.generators.mkLuaInline ''{"prettierd", "injected"}'';
            nix = lib.generators.mkLuaInline ''{"alejandra", "injected"}'';
            # nix = ["alejandra"];
          };
          # formatters.injected.options = {
          #   lang_to_ft = {
          #     nix = "nix";
          #     bash = "sh";
          #     lua = "lua";
          #   };
          #   lang_to_ext = {
          #     bash = "sh";
          #     lua = "lua";
          #     nix = "nix";
          #   };
          #   lang_to_formatters = {
          #     # rust = ["rustfmt"];
          #     bash = ["shfmt" "injected"];
          #   };
          # };
        };
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
