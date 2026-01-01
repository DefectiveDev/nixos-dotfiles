{config, ...}:
let
    inherit (config.lib.formats.rasi) mkLiteral;
    rofi-extraConfig = {
        kb-accept-entry = "Control+m,Return,KP_Enter";
        kb-row-up = "Up,Control+p,Control+k"; #,ISO_Left_Tab already generated
        kb-row-down = "Down,Control+n,Control+j";
        kb-remove-to-eol = "";
    };

    rofi-theme = {
        "*" = {
            drac-bgd = mkLiteral "#22212C00";
            drac-cur = mkLiteral "#454158";
            drac-fgd = mkLiteral "#f8f8f2";
            drac-cmt = mkLiteral "#7970A9";
            drac-cya = mkLiteral "#80FFEA";
            drac-grn = mkLiteral "#50fa7b";
            drac-ora = mkLiteral "#ffb86c";
            drac-pnk = mkLiteral "#FF80BF";
            drac-pur = mkLiteral "#9580FF";
            drac-red = mkLiteral "#ff5555";
            drac-yel = mkLiteral "#FFFF80";

            foreground = mkLiteral "@drac-fgd";
            background-color = mkLiteral"@drac-bgd";
            active-background = mkLiteral"@drac-pnk";
            urgent-background = mkLiteral"@drac-red";
            urgent-foreground = mkLiteral"@drac-bgd";

            selected-background = mkLiteral "@active-background";
            selected-urgent-background = mkLiteral "@urgent-background";
            selected-active-background = mkLiteral"@active-background";
            separatorcolor = mkLiteral"@active-background";
            bordercolor = mkLiteral"@drac-cmt";
        };

        "#window" = {
            background-color = mkLiteral "@background-color";
            border = 0;
            border-radius = 0;
            border-color = mkLiteral "@bordercolor";
            padding = 15;
        };

        "#mainbox" = {
            border = 0;
            padding = 0;
        };

        "#message" = {
            border = mkLiteral "0px";
            border-color = mkLiteral "@separatorcolor";
            padding = mkLiteral "1px";
        };

        "#textbox" = {
            text-color = mkLiteral "@foreground";
        };

        "#listview" = {
            fixed-height = 0;
            border = mkLiteral "0px";
            border-color = mkLiteral "@bordercolor";
            spacing = mkLiteral "2px";
            scrollbar = false;
            padding = mkLiteral "2px 0px 0px";
        };

        "#element" = {
            border = 0;
            padding = mkLiteral "3px";
        };

        "#element.normal.normal" = {
            background-color = mkLiteral "@background-color";
            text-color = mkLiteral "@foreground";
        };

        "#element.normal.urgent" = {
            background-color = mkLiteral "@urgent-background";
            text-color = mkLiteral "@urgent-foreground";
        };

        "#element.normal.active" = {
            background-color = mkLiteral "@active-background";
            text-color = mkLiteral "@background-color";
        };

        "#element.selected.normal" = {
            background-color = mkLiteral "@selected-background";
            text-color = mkLiteral "@foreground";
        };

        "#element.selected.urgent" = {
            background-color = mkLiteral "@selected-urgent-background";
            text-color = mkLiteral "@foreground";
        };

        "#element.selected.active" = {
            background-color = mkLiteral "@selected-active-background";
            text-color = mkLiteral "@foreground";
        };

        "#element.alternate.normal" = {
            background-color = mkLiteral "@background-color";
            text-color = mkLiteral "@foreground";
        };

        "#element.alternate.urgent" = {
            background-color = mkLiteral "@urgent-background";
            text-color = mkLiteral "@foreground";
        };

        "#element.alternate.active" = {
            background-color = mkLiteral "@active-background";
            text-color = mkLiteral "@foreground";
        };

        "#scrollbar" = {
            width = mkLiteral "2px";
            border = 0;
            handle-width = mkLiteral "8px";
            padding = 0;
        };

        "#sidebar" = {
            border = mkLiteral "2px dash 0px 0px";
            border-color = mkLiteral "@separatorcolor";
        };

        "button.selected" = {
            background-color = mkLiteral "@selected-background";
            text-color = mkLiteral "@foreground";
        };

        "#inputbar" = {
            spacing = 0;
            text-color = mkLiteral "@foreground";
            padding = mkLiteral "1px";
        };

        "#case-indicator" = {
            spacing = 0;
            text-color = mkLiteral "@foreground";
        };

        "#entry" = {
            spacing = 0;
            text-color = mkLiteral "@drac-cya";
        };

        "#prompt" = {
            spacing = 0;
            text-color = mkLiteral "@drac-grn";
        };

        "#inputbar" = {
            children = map mkLiteral [ "prompt" "textbox-prompt-colon" "entry" "case-indicator" ];
        };

        "#textbox-prompt-colon" = {
            expand = false;
            str = ">";
            margin = mkLiteral "0px 0.3em 0em 0em";
            text-color = "@drac-pur";
        };

        "element-text" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
        };

        "element-icon" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
        };

    };
in
{
    programs.rofi = {
        enable = true;
        theme = rofi-theme;
        extraConfig = rofi-extraConfig;
    };
}
