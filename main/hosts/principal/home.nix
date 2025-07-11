{
  inputs,
  pkgs,
  lib,
  stylix,
  config,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    # ./../../elnixvim/nixvim.nix
    ./../../modulos/home-manager/stylix-hm.nix
    ./../../modulos/home-manager/funcionalidad/firefox.nix

    ./../../modulos/portabilizacion/home-manager.nix

    ./../../modulos/home-manager/rofi.nix

    # ./modulos/gnome_personalizacion.nix
    ./../../modulos/home-manager/funcionalidad/hyperland.nix
    ./../../modulos/home-manager/funcionalidad/waybar.nix

    ./../../modulos/home-manager/github.nix
    ./../../modulos/home-manager/terminal.nix
  ];
  home.username = "ruiz";
  home.homeDirectory = "/home/ruiz";
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  qt.enable = true;
  # gtk.enable = true;
  # gtk.gtk3.extraConfig = {
  #   Settings = ''
  #     gtk-application-prefer-dark-theme=1
  #   '';
  # };
  # gtk.gtk4.extraConfig = {
  #   Settings = ''
  #     gtk-application-prefer-dark-theme=1
  #   '';
  # };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # programs.bash = {
  #     enable = true;
  #   };

  # environment.

  # services.pass-secret-service.enable = true;

  # environment = {
  #   "FLAKE" = "/etc/nixos";
  # };
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    nerd-fonts.symbols-only
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  fonts.fontconfig.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".config/kitty/inicio.conf".text = ''
    #   layout tall
    #   launch sh -c "neofetch"
    # '';

    # ".local/share/rofi/themes/custom1.rasi".source = "${
    #   (pkgs.fetchFromGitHub {
    #     owner = "w8ste";
    #     repo = "Tokyonight-rofi-theme";
    #     rev = "7e22c3e516e2f32259f4bf30b658f4b2bb989313";
    #     hash = "sha256-f7XugMkf7Ylp2fY2MY7q1+p+awFOaIrNkCIR0SbOA30=";
    #   })
    # }/tokyonight_big1.rasi";

    ".config/mimeapps.list".text = ''[ Default Applications ] inode/directory= thunar/desktop '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ruiz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
    BROWSER = "librewolf";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
