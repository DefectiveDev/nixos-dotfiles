{pkgs, ...}:
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
            background_opacity 0.5
            confirm_os_window_close 0
            map shift+enter send_text application \x1b[13;2u
        '';
    };
}
