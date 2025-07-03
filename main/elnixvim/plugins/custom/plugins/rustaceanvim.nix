{pkgs, ...}: {
  programs.nixvim.plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        full = true;
        server = {
          standalone = false;
          cmd = [
            "rustup"
            "rust-analyzer"
          ];

          default_settings = {
            rust-analyzer = {
              cargo = {
                allTargets = true;
              };
            };
          };
        };
      };
    };

    dap-lldb = {
      enable = true;
    };
    lspconfig = {
      enable = true;
      autoLoad = true;
    };
  };
  programs.nixvim.dependencies = {
    rust-analyzer.enable = true;
  };
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    rust-vim
  ];
  programs.nixvim.extraPackages = with pkgs; [
    cargo
    rustc
    # rustup
    rust-analyzer
    rustfmt
    pkg-config
    udev
    alsa-lib
    vulkan-loader
  ];

  # home.sessionVariables = {
  #   LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${
  #     with pkgs;
  #       pkgs.lib.makeLibraryPath [
  #         xorg.libX11
  #         xorg.libXcursor
  #         xorg.libXi
  #         libxkbcommon
  #         xorg.libxcb
  #         pkgs.vulkan-loader
  #         pkgs.glfw
  #       ]
  #   }";
  # };
  home.packages = with pkgs; [
    # rust-analyzer
    # rustc
    # cargo
  ];
}
