{
  self,
  inputs,
  ...
}: {
  flake.modules.nvf.arduino = {
    pkgs,
    lib,
    # self',
    ...
  }: {
    config.vim = {
      #NOTE: dependencias
      extraPackages = with pkgs; [
        # arduino-cli
        arduino-language-server
        # llvmPackages_19.clang-tools
        libclang
        self.packages.${pkgs.stdenv.hostPlatform.system}.arduinoPatched
      ];

      extraPlugins = {
        Arduino-Nvim = {
          package = pkgs.vimUtils.buildVimPlugin {
            name = "Arduino-Nvim";
            # src = pkgs.fetchFromGitHub {
            #   owner = "XxMar1an0xX";
            #   repo = "Arduino-Nvim";
            #   rev = "08bae0ba025998fd60e214146e85400e297a892a";
            #   hash = "sha256-WiOdwEDKba4pqAgwGU/1EykReSXQiggnJGCGpBGS+8g=";
            # };
            src = pkgs.fetchFromGitHub {
              owner = "yuukiflow";
              repo = "Arduino-Nvim";
              rev = "c9983b5ead3b2ce574d9bcb9708febad0f8ddbd7";
              hash = "sha256-6Fj4Dy5NdaBecG+lb0XBKL/KFPevJw+Q9Z0wkhByJzY=";
            };
          };
          setup =
            /*
            lua
            */
            ''
              -- vim.api.nvim_create_autocmd("FileType", {
              -- 	pattern = "arduino",
              -- 	callback = function()
              -- 		require("Arduino-Nvim")
              -- 	end,
              -- })
              require("Arduino-Nvim").setup({})
              -- dir = vim.fn.stdpath("config") .. "/lua/Arduino-Nvim",
              -- ft = "arduino",
              -- opts = {},
              -- dependencies = {
              -- 	"nvim-telescope/telescope.nvim",
              -- 	"neovim/nvim-lspconfig",
              -- },
            '';
          # load =
          #   /*
          #   lua
          #   */
          #   ''
          #     return {
          #     	dir = vim.fn.stdpath("config") .. "/lua/Arduino-Nvim",
          #     	ft = "arduino",
          #     	-- opts default values
          #     	opts = {
          #     		config_file = ".arduino_config.lua", -- filename used to persist the config
          #     		board = "arduino:avr:uno", -- target board
          #     		port = "/dev/ttyUSB0", -- target port
          #     		baudrate = 115200, -- target baudrate
          #     		use_default_keymaps = true, -- load default keymaps
          #     		use_default_commands = true, -- load default commands
          #     		keymaps = {}, -- custom keymaps
          #     		picker_backend = "telescope", -- backend to use for user input commands
          #     	},
          #     	dependencies = {
          #     		"nvim-telescope/telescope.nvim",
          #     		"neovim/nvim-lspconfig",
          #     	},
          #     }
          #   '';
        };
      };
      # languages.arduino = {
      #   enable = true;
      #   lsp = {
      #     enable = true;
      #   };
      #   treesitter.enable = true;
      # };
      # lsp.presets.arduino-language-server = {
      #   enable = true;
      # };
      # lsp = {
      #   servers = {
      #     arduino = {
      #       #NOTE: si hay error verificar que el board este installado con:
      #       # arduino-cli core install
      #       enable = true;
      #       capabilities =
      #         lib.generators.mkLuaInline
      #         /*
      #         lua
      #         */
      #         ''
      #
      #           {
      #                 textDocument = {
      #                         semanticTokens = vim.NIL,
      #                   },
      #                   workspace = {
      #                           semanticTokens = vim.NIL,
      #                   },
      #           }
      #         '';
      #       cmd = [
      #         "${pkgs.arduino-language-server}/bin/arduino-language-server"
      #         # "arduino-language-server"
      #         "-clangd"
      #         "clangd"
      #         "-cli-config"
      #         "$HOME/.arduino15/arduino-cli.yaml"
      #         "-cli"
      #         # "arduino-cli"
      #         "${self.packages.${pkgs.stdenv.hostPlatform.system}.arduinoPatched}/bin/arduino-cli"
      #         # "${pkgs.clang-tools}/bin/clangd"
      #         "-fqbn"
      #         # "arduino:avr:uno"
      #         "esp32:esp32:esp32"
      #       ];
      #       filetypes = ["arduino"];
      #       root_dir =
      #         lib.generators.mkLuaInline
      #         /*
      #         lua
      #         */
      #         ''
      #            function(bufnr, on_dir)
      #              on_dir(vim.fn.expand "%:p:h")
      #           end
      #         '';
      #     };
      #   };
      #   #NOTE: nunca olvidar esta opcion
      #   enable = true;
      #   formatOnSave = true;
      #   lspconfig.enable = true;
      #   mappings.format = "<leader>ft";
      # };
    };
  };
}
