{ ... }: {
    flake.homeModules.brave = { pkgs, ... }: {
        programs.chromium = {
            enable = true;
            package = pkgs.brave;
        };
    };

    flake.nixosModules.brave = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            brave
        ];
    };
}
