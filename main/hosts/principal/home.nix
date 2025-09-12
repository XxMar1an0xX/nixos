{
  inputs,
  pkgs,
  lib,
  stylix,
  config,
  EsPortable,
  ...
}: let
  CondicionalPortable = Si: No: (
    if EsPortable
    then Si
    else No
  );
  #TODO: hacer que no tenga q cambiar la opcion aca
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    {
      _module.args = {inherit CondicionalPortable;};
    }
    # ./../../elnixvim/nixvim.nix
    ./../../modulos/home-manager/stylix-hm.nix
    ./../../modulos/home-manager/funcionalidad/firefox.nix

    # ./../../modulos/portabilizacion/home-manager.nix

    ./../../modulos/home-manager/rofi.nix

    # ./modulos/gnome_personalizacion.nix
    ./../../modulos/home-manager/funcionalidad/hyperland.nix
    ./../../modulos/home-manager/funcionalidad/waybar.nix

    ./../../modulos/home-manager/github.nix
    ./../../modulos/home-manager/terminal.nix
    ./../../modulos/home-manager/config-cortas.nix
  ];
  home.username = "ruiz";
  home.homeDirectory = "/home/ruiz";
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  # nixpkgs.config = {allowUnfree = true;};

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
    # "Fetcheo directorio" = {
    #   target = ".mozilla/firefox/ruiz/chrome/homa";
    #   source = "${pkgs.fetchFromGitHub {
    #     owner = "akshat46";
    #     repo = "FlyingFox";
    #     rev = "4a6ba46cafc189ad628ee13bb8d3eef3e69fbced";
    #     hash = "sha256-ZUTQ2VvIAEPbLnEX2AYScAGTM3hWp7vUuGCz2wd8qG0=";
    #   }}/chrome";
    #   # fetchTree #NOTE: puede ser util
    #   # {
    #   #   type = "github";
    #   #   owner = "akshat46";
    #   #   repo = "FlyingFox";
    #   #   # dir = "chrome";
    #   #   rev = "4a6ba46cafc189ad628ee13bb8d3eef3e69fbced";
    #   # };
    #   recursive = true;
    # };
    "Nixos Repo" = {
      target = "ReadOnly/NixosConfig";
      source = "${pkgs.fetchFromGitHub {
        owner = "XxMar1an0xX";
        repo = "nixos";
        rev = "75a63be6eeedeb844e54d31d1fc5075e4e6b2c9c";
        hash = "sha256-Hjr17i5c+DM2YO6W6heBZy/VCVjWYdeSVNLUKoMUWKE=";
      }}";
    };
    "Rust Repo" = {
      target = "ReadOnly/Rust";
      source = "${pkgs.fetchFromGitHub {
        owner = "XxMar1an0xX";
        repo = "Rust";
        rev = "27a7a045b1b0b20da34b6e75d818013713227e8b";
        hash = "sha256-vp9DNUe45dqG82s0A2zrV8b/xvtVi4XQE9l+aaDDdCE=";
      }}";
    };

    ".local/share/PrismLauncher/accounts.json".text =
      /*
      json
      */
      ''
        {
            "accounts": [
                {
                    "entitlement": {
                        "canPlayMinecraft": true,
                        "ownsMinecraft": true
                    },
                    "profile": {
                        "capes": [
                        ],
                        "id": "47671e15d3694526bcffcae3f8b5bd6d",
                        "name": "No me ELIMINES!!! / Don't ELIMINATE me!!!",
                        "skin": {
                            "id": "",
                            "url": "",
                            "variant": ""
                        }
                    },
                    "type": "Offline",
                    "ygg": {
                        "extra": {
                            "clientToken": "29430f0b9858497f8f44895419128ffe",
                            "userName": "No me ELIMINES!!! / Don't ELIMINATE me!!!"
                        },
                        "iat": 1671854392,
                        "token": "0"
                    }
                },
                {
                    "active": true,
                    "entitlement": {
                        "canPlayMinecraft": true,
                        "ownsMinecraft": true
                    },
                    "profile": {
                        "capes": [
                        ],
                        "id": "70a91ce79a8d3d4c9c98262b2e5ae720",
                        "name": "Xx_Mar1an0_xX",
                        "skin": {
                            "id": "",
                            "url": "",
                            "variant": ""
                        }
                    },
                    "type": "Offline",
                    "ygg": {
                        "extra": {
                            "clientToken": "0cdcf2bc3b394a628544a4be0b66e200",
                            "userName": "Xx_Mar1an0_xX"
                        },
                        "iat": 1734619216,
                        "token": "0"
                    }
                }
            ],
            "formatVersion": 3
        }
      '';
    # ".local/share/rofi/themes/custom1.rasi".source = "${
    #   (pkgs.fetchFromGitHub {
    #     owner = "w8ste";
    #     repo = "Tokyonight-rofi-theme";
    #     rev = "7e22c3e516e2f32259f4bf30b658f4b2bb989313";
    #     hash = "sha256-f7XugMkf7Ylp2fY2MY7q1+p+awFOaIrNkCIR0SbOA30=";
    #   })
    # }/tokyonight_big1.rasi";
    ".config/jamesdsp/audio.conf".text = ''
      bass_enable=false
      bass_maxgain=5
      compander_enable=false
      compander_granularity=2
      compander_response=95.0;200.0;400.0;800.0;1600.0;3400.0;7500.0;0;0;0;0;0;0;0
      compander_time_freq_transforms=0
      compander_timeconstant=0.22000
      convolver_enable=false
      convolver_file=
      convolver_optimization_mode=0
      convolver_waveform_edit=-80;-100;0;0;0;0
      crossfeed_bs2b_fcut=700
      crossfeed_bs2b_feed=60
      crossfeed_enable=false
      crossfeed_mode=0
      ddc_enable=false
      ddc_file=
      graphiceq_enable=true
      graphiceq_param=GraphicEQ: 20 -3.1; 21 -3.4; 22 -3.6; 23 -3.9; 24 -4.2; 26 -4.8; 27 -5.1; 29 -5.4; 30 -5.7; 32 -6.1; 34 -6.4; 36 -6.6; 38 -6.9; 40 -7.2; 43 -7.6; 45 -7.8; 48 -8.1; 50 -8.3; 53 -8.5; 56 -8.6; 59 -8.6; 63 -8.6; 66 -8.5; 70 -8.2; 74 -7.7; 78 -7.2; 83 -6.9; 87 -6.7; 92 -7; 97 -7.4; 103 -6.5; 109 -5.9; 115 -6.3; 121 -6.7; 128 -6.9; 136 -6.8; 143 -6.4; 151 -5.7; 160 -4.5; 169 -3.2; 178 -2.1; 188 -1.1; 199 -0.5; 210 -0.5; 222 -1; 235 -1.7; 248 -2.4; 262 -3; 277 -3.6; 292 -4.1; 309 -4.4; 326 -4.6; 345 -4.8; 364 -4.9; 385 -5; 406 -5.1; 429 -5.1; 453 -5.1; 479 -5; 506 -4.9; 534 -4.8; 565 -4.7; 596 -4.6; 630 -4.6; 665 -4.6; 703 -4.7; 743 -4.9; 784 -5.2; 829 -5.5; 875 -5.7; 924 -6; 977 -5.9; 1032 -5.6; 1090 -5.2; 1151 -5; 1216 -5; 1284 -5.1; 1357 -5; 1433 -4.8; 1514 -4.6; 1599 -4.6; 1689 -4.7; 1784 -4.8; 1885 -5; 1991 -5.3; 2103 -5.7; 2221 -5.9; 2347 -5.9; 2479 -5.6; 2618 -5.2; 2766 -4.7; 2921 -4; 3086 -3; 3260 -1.6; 3443 -0.2; 3637 -0.5; 3842 -2; 4058 -3.4; 4287 -4.8; 4528 -6.3; 4783 -7.5; 5052 -8.1; 5337 -8.5; 5637 -8.1; 5955 -7.5; 6290 -8.7; 6644 -9.4; 7018 -9.1; 7414 -8.7; 7831 -8.1; 8272 -7.2; 8738 -6.3; 9230 -5.7; 9749 -5.3; 10298 -5.1; 10878 -5.4; 11490 -5.7; 12137 -6.2; 12821 -6.8; 13543 -7.4; 14305 -8.2; 15110 -9.1; 15961 -10.1; 16860 -11.2; 17809 -12.4; 18812 -13.8; 19871 -15.2
      liveprog_enable=false
      liveprog_file=
      master_enable=true
      master_limrelease=60
      master_limthreshold=0
      master_postgain=0
      reverb_bassboost=0.25000
      reverb_decay=2.09000
      reverb_delay=0.00000
      reverb_enable=false
      reverb_finaldry=-7.00000
      reverb_finalwet=-9.00000
      reverb_lfo_spin=0.70000
      reverb_lfo_wander=0.30000
      reverb_lpf_bass=600
      reverb_lpf_damp=9000
      reverb_lpf_input=18000
      reverb_lpf_output=17000
      reverb_osf=1
      reverb_reflection_amount=0.30000
      reverb_reflection_factor=1.00000
      reverb_reflection_width=0.70000
      reverb_wet=-8.00000
      reverb_width=1.00000
      stereowide_enable=false
      stereowide_level=60
      tone_enable=false
      tone_eq=25.0;40.0;63.0;100.0;160.0;250.0;400.0;630.0;1000.0;1600.0;2500.0;4000.0;6300.0;10000.0;16000.0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0
    '';

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
