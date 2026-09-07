{ ... }: {
    flake.homeModules.librewolf = {
        programs.librewolf = {
            enable = true;
        };
    };

    flake.nixosModules.librewolf = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            librewolf
        ];
    };
}
