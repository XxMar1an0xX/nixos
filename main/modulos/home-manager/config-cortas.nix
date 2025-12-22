{
  lib,
  pkgs,
  ...
}: {
  programs = {
    yazi = {
      enable = true;
      settings.yazi = {
        manager = {
          sort_by = "mtime";
          show_hidden = true;
          sort_dir_first = true;
          scrolloff = 4;
          linemode = "mtime";
        };
      };
    };
    btop = {
      enable = true;
      settings = {
        color_theme = "nord";
        update_ms = 500;
        graph_symbol = "braille";
        truecolor = true;
        theme_background = true;
        base_10_sizes = true;
      };
    };
    keepassxc = {
      enable = true;
      settings = {
        Browser.Enabled = true;
      };
    };
    cava = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      # settings = lib.mkForce (builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
      #     owner = "fredericrous";
      #     repo = "dotfiles";
      #     rev = "cf793fb3f87f8de1eb2e7c90a23252226d8aaf70";
      #     hash = "sha256-yr6HasmCorNsVRVeix3OM5Acqwk7K23HCvMMqyi0RT8=";
      #   }
      #   + "/private_dot_config/starship.toml")));
      # # + "/dotfiles/config/starship.toml")));
      settings = lib.mkForce (builtins.fromTOML (builtins.readFile ./../../recursos/starship.toml));
    };

    bash = {
      enable = true;
      shellAliases = {
        haziso = "nix run nixpkgs#nixos-generators -- --format iso --flake $NH_FLAKE#portable -o laptop";
        rephm = "sudo nixos-rebuild switch --flake $NH_FLAKE";
        ff = "fastfetch";
        ns = "nix-shell -p ";
      };
    };
  };
  services = {
    clipse = {
      # enable = true;
      imageDisplay.type = "kitty";
    };
  };
}
