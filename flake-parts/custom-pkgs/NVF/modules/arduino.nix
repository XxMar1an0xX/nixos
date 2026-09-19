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
              vim.api.nvim_create_autocmd("FileType", {
                      pattern = "arduino",
                      callback = function()
                              require("Arduino-Nvim").setup({
                                      -- clangd = "${pkgs.libclang}/bin/clangd",
                                      -- root_dir = ""
                                      baudrate = 115200,
                                      board = "esp32:esp32:esp32",
                              })
                      end,
              })
            '';
        };
      };
    };
  };
}
