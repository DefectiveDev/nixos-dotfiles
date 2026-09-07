{ ... }: {
    flake.homeModules.librewolf = { pkgs, ... }: {
        programs.librewolf = {
            enable = true;
        };

        # makes librewolf the default browser
        xdg = {
            mimeApps = {
                enable = true;
                defaultApplications = {
                    "text/html" = "librewolf.desktop";
                    "x-scheme-handler/http" = "librewolf.desktop";
                    "x-scheme-handler/https" = "librewolf.desktop";
                    "x-scheme-handler/about" = "librewolf.desktop";
                    "x-scheme-handler/unknown" = "librewolf.desktop";
                };
            };
            desktopEntries.librewolf = {
                name = "LibreWolf";
                exec = "${pkgs.librewolf}/bin/librewolf";
            };
        };
    };

    flake.nixosModules.librewolf = { pkgs, ... }: {

        environment.systemPackages = with pkgs; [
            librewolf
        ];
    };
}
