{ config, pkgs, lib, unstable-pkgs, inputs, ...}:

{
    imports = [
        ./programs/nvim.nix
        ./programs/kitty.nix
        ./programs/zsh.nix
        ./programs/lsd.nix
        # ./flatpak-theme-workaround.nix
    ];

    home.username = "framework";
    home.homeDirectory = "/home/framework";

    home.packages = with pkgs; [
        yq # used for yml files and added for TMUX plugin
        aseprite
        blender
        godot-mono
        slurp#capture wayland region
        xdg-desktop-portal-hyprland#capture wayland windows
        wl-clipboard
        wl-clip-persist #when application closes this will keep the items saved
        grim #screenshots
        hyprpaper
        waybar
        wofi
        htop-vim
        libnotify
        nwg-look
        obs-cli
        socat #for socket connections used in hyprland

        #fonts
        nerd-fonts.iosevka-term-slab
        nerd-fonts.symbols-only
        nerd-fonts.noto
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
    ] ++ (with unstable-pkgs; [
        fastfetch
        inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    ]) ++ [
    ];

    programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
            obs-vaapi # AMD hardware encoding
            obs-websocket
        ];
    };

    programs.bluetuith.enable = true;

    gtk = {
        enable = true;
        theme = {
            name = "Dracula";
            package = pkgs.dracula-theme;
        };
        iconTheme = {
            name = "Dracula";
            package = pkgs.dracula-icon-theme;
        };
        colorScheme = "dark";
        font = {
            name = "NotoSans Nerd Font Propo";
            package = pkgs.nerd-fonts.noto;
        };


    };

    qt = {
        enable = true;
        # platformTheme.name= "gtk2";
        # style = {
        #     name = "Dracula";
        #     package = pkgs.dracula-qt5-theme;
        # };
    };

    # disabled to avoid hyprland config warning on build
    # wayland.windowManager.hyprland.enable = true;
    home.file.".config/hypr".source = ../../.config/hypr;
    home.sessionVariables.NIXOS_OZONE_WL = "1"; #tell electron apps to use wayland

    home.file.".config/waybar".source = ../../.config/waybar;

    services.swaync.enable = true;
    home.file.".config/swaync".source = ../../.config/swaync;

    home.file.".config/dunst".source = ../../.config/dunst;

    home.file.".config/wofi".source = ../../.config/wofi;

    programs.starship.enable = true;
    home.file.".config/starship.toml".source = ../../.config/starship.toml;

    programs.tmux.enable = true;
    home.file.".config/tmux" = {
        source = ../../.config/tmux;
        recursive = true;
    };
    home.file.".config/scripts".source = ../../scripts;

    home.file.".config/fd".source = ../../.config/fd;

    programs = {
        lazygit.enable = true;
        bash.enable = true;
        fd.enable = true;
        ripgrep.enable = true;

        yazi = {
            enable = true;
            enableZshIntegration = true;
            theme = {
                status = {
                    separator_open = "";
                    separator_close = "";
                };
            };
        };

        direnv = {
            enable = true;
            enableZshIntegration = true;
            nix-direnv.enable = true;
            config = { global = { hide_env_diff = true; }; };
        };

        script-directory = {
            enable = true;
            settings = { SD_ROOT = "${config.home.homeDirectory}/.nixos-dotfiles/scripts"; };
        };

        home-manager = {
            enable = true;
            path = lib.mkForce "$HOME/.nixos-dotfiles/nixos";
        };

        fzf = {
            enable = true;
            colors = {
                fg="-1";
                bg="-1";
                hl="#5fff87";
                "fg+"="-1";
                "bg+"="-1";
                "hl+"="#ffaf5f";
                info="#af87ff";
                prompt="#5fff87";
                pointer="#ff87d7";
                marker="#ff87d7";
                spinner="#ff87d7";
            };
        };

        bat = {
            enable = true;
            config= {
                theme = "Dracula";
            };
            themes = {
                dracula = {
                    src = pkgs.fetchFromGitHub {
                        owner = "dracula";
                        repo = "sublime";
                        rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
                        sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
                    };
                    file = "Dracula.tmTheme";
                };
            };
        };

        zoxide = {
            enable = true;
            options = [
                "--cmd cd"
            ];
        };

        # btop = {
        #     enable = true;
        #     settings = {
        #         color_theme = "dracula";
        #         theme_background = false;
        #         vim_keys = true;
        #         show_battery = false;
        #     };
        # };
    };

#do not change used to determine what old packages were based on. Look up how before doing so
    home.stateVersion = "25.05";
}
