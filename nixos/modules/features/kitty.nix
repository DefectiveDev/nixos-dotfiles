{ self, inputs, ...}: {
    flake.homeModules.kitty = {pkgs, ...}:
    {
        programs.kitty = {
            enable = true;
            font.name = "IosevkaTermSlab Nerd Font";
            # font.name = "JetBrainsMono Nerd Font Propo";
            # font.name = "FiraCode Nerd Font Propo";
            # font.name = "NotoMono Nerd Font";
            #font.package = (pkgs.nerd-fonts.override { fonts = ["FiraCode"]; });
            settings.enable_audio_bell = false;
            extraConfig = ''
                background #22212C
                foreground #f8f8f2
                cursor #ABB2BF
                selection_background #44475a
                color0 #191A21
                color8 #4B5263
                color1 #ff5555
                color9 #FF6E6E
                color2 #50fa7b
                color10 #8AFF80
                color3 #FFFF80
                color11 #F1FA8C
                color4 #9580FF
                color12 #bd93f9
                color5 #FF80BF
                color13 #FF92DF
                color6 #80FFEA
                color14 #A4FFFF
                color7 #ABB2BF
                color15 #ffffff
                selection_foreground #1e1f28
                background_opacity 0.75
                background_blur 1
                confirm_os_window_close 0
                map shift+enter send_text application \x1b[13;2u
                # Nerd Fonts v3.4.0
                symbol_map U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono
            '';
        };
    };
}
