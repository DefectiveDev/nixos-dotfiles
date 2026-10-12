{ self, inputs, ...}: {
    flake.nixosModules.mango = {pkgs, ...}: {
        imports = [
            self.nixosModules.wayland
            inputs.mangowm.nixosModules.mango
        ];
        environment.systemPackages = with pkgs; [
            wlr-randr
        ];
        # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-wlr];
        programs.mango.enable = true;
        home-manager.sharedModules = [({ ... }: {
            home.file.".config/mango".source = ./.;
        })];
    };
}
