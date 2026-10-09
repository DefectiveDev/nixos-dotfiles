{ ... }: {
    flake.homeModules.wofi = {pkgs, ... }: {
        home.packages = with pkgs; [
            wofi
        ];
        home.file.".config/wofi".source = ./.;
    };
}
