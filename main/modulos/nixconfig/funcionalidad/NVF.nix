{
  pkgs,
  lib,
  ...
}: let
  configuracion = {
    extraPackages = with pkgs; [ripgrep gcc cargo rustc alejandra clipse lldb fzf nerd-fonts.symbols-only git gh];
    viAlias = true;
    vimAlias = true;
    extraPlugins = {
      nighfox = {
        package = pkgs.vimPlugins.nightfox-nvim;
        setup =
          /*
          lua
          */
          ''
                      require('nightfox').setup {}
                      vim.cmd("colorscheme nordfox")
                      -- vim.api.nvim_create_autocmd("VimEnter", {
            	-- callback = function()
            	-- 	vim.cmd("Alpha")
            	-- end,
            -- })
          '';
      };
      arduino = {
        package = pkgs.callPackage ./../custompkgs/arduino-nvim.nix {};
        # setup = ''
        # '';
      };
    };
    # useSystemClipboard = true;
    # additionalRuntimePaths = [
    #   "$HOME/Documentos/nixos/main/"
    # ];

    theme = lib.mkForce {
      enable = false;
      extraConfig = ''
      '';
      # name = "nord";
      # style = "dark";
      # base16-colors = {
      #   base00 = "2e3440";
      #   base01 = "39404f";
      #   base02 = "444c5e";
      #   base03 = "465780";
      #   base04 = "7e8188";
      #   base05 = "cdcecf";
      #   base06 = "abb1bb";
      #   base07 = "e7ecf4";
      #   base08 = "bf616a";
      #   base09 = "c9826b";
      #   base0A = "ebcb8b";
      #   base0B = "a3be8c";
      #   base0C = "88c0d0";
      #   base0D = "81a1c1";
      #   base0E = "b48ead";
      #   base0F = "bf88bc";
      # };
    };
    diagnostics = {
      enable = true;
      config = {
        update_in_insert = true;
        virtual_lines = true;
      };
    };

    clipboard = {
      enable = true;
      providers = {};
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
        mappings = {
          open = "<leader>t";
        };
        setupOpts = {
          insert_mappings = true;
          terminal_mappings = true;
          # start_in_insert = false;
        };
      };
    };

    telescope = {
      enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha = {
        enable = true;
        theme = "startify";
      };
    };

    projects = {
      project-nvim.enable = true;
    };

    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = false;
      };
    };

    spellcheck = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>fs";
        mode = "n";
        silent = true;
        action = ":Neotree toggle<CR>";
      }
      {
        key = "<leader>t";
        mode = "t";
        silent = true;
        action = "exit \n";
      }
      # {
      #   key = "<Esc>";
      #   mode = "t";
      #   silent = true;
      #   # action = "";
      # }
      # {
      #   key = "<leader>t";
      #   mode = "n";
      #   silent = true;
      #   action = "";
      # }
    ];

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    lsp = {
      enable = true; #NOTE: lacra de mrd como 2 horas boludeando para q sea esto
      formatOnSave = true;
      lspconfig.enable = true;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      # lspSignature.enable = true;
      otter-nvim.enable = true;
      # lsplines.enable = true;
      nvim-docs-view.enable = true;

      mappings.format = "<leader>ft";
    };

    formatter.conform-nvim = {
      # enable = true;
      #
      # setupOpts.formaters_by_ft = {
      #   nix = [
      #     "alejandra"
      #   ];
      # };
    };

    languages = {
      # enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix = {
        enable = true;
        extraDiagnostics.enable = true;
        format = {
          enable = true;
          type = "alejandra";
        };
        lsp = {
          enable = true;
          server = "nixd";
          options = {
            # filetypes = [ #NOTE: esta lacra hacia fallar el autoformateo
            #   "nix"
            # ];
            # formatting.command = ["alejandra"];
            nixpkgs.expr = "import <nixpkgs> { }";
            nixos.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.options";
            home-manager.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.options.home-manager.users.value.ruiz";
            # nix-on-droid.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixOnDroidConfigurations.default.options";
            lib-macros.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.lib";

            #   # "home-manager".expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.options.home-manager.users.value.ruiz";
            #   #
            #   # nixos.expr = "(builtins.getFlake \"/home/ruiz/Documentos/nixos/main\").nixosConfigurations.nixos.options";
            #   # nixvim.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.config.home-manager.users.ruiz.programs.nixvim";
            #   # # nix-on-droid.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixOnDroidConfigurations.default.options";
            #   #
            #   # lib-macros.expr = "(builtins.getFlake \"github:XxMar1an0xX/nixos?dir=main\").nixosConfigurations.nixos.lib";
          };
        };
        treesitter.enable = true;
      };
      rust = {
        enable = true;
        crates = {
          enable = true;
          codeActions = true;
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

    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        enable_diagnostics = true;
        enable_git_status = true;
        enable_modified_markers = true;
        enable_refresh_on_write = true;
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      nvim-cursorline = {
        enable = true;
        setupOpts = {
          cursorline = {
            enable = true;
            timeout = 0;
          };
        };
      };
      # cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      nvim-scrollbar.enable = true;

      highlight-undo = {
        enable = true;
        setupOpts = {
          duration = 100;
        };
      };
      indent-blankline.enable = true;
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete = {
      enableSharedCmpSources = true;
      # nvim-cmp.enable = true;
      blink-cmp = {
        friendly-snippets.enable = true;
        enable = true;
        sourcePlugins = {
          # treesitter = {
          #   package = "cmp-treesitter";
          #   enable = true;
          # };
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

    snippets.luasnip.enable = true;

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
      # hardtime-nvim.enable = isMaximal;
    };

    utility = {
      ccc.enable = false;
      surround.enable = true;
      smart-splits.enable = true;
      # vim-wakatime.enable = true;
      icon-picker.enable = true;
      diffview-nvim.enable = true;
      motion = {
        hop.enable = true;
        leap.enable = true;
      };
      images = {
        image-nvim.enable = false;
      };
      leetcode-nvim = {
        enable = true;
        setupOpts = {
          image_support = true;
          lang = "rust";
        };
      };
    };

    notes = {
      todo-comments.enable = true;
      mind-nvim.enable = true;
    };
    session = {
      nvim-session-manager.enable = false;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "nord";
      };
    };

    comments = {
      comment-nvim.enable = true;
    };

    presence = {
      neocord.enable = true;
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      illuminate.enable = true;
      fastaction.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
      # smartcolumn = {
      #   enable = true;
      #   setupOpts.custom_colorcolumn = {
      #     # this is a freeform module, it's `buftype = int;` for configuring column position
      #     rust = "100";
      #     nix = "110";
      #     ruby = "120";
      #     java = "130";
      #     go = ["90" "130"];
      #   };
      # };
    };
  };
in
  if false
  then {
    programs.nvf = {
      enable = true;
      defaultEditor = true;
      settings = configuracion;
    };
  }
  else {
    config.vim = configuracion;
  }
