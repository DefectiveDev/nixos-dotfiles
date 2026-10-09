{ self, inputs, ...}: {
    flake.nixosModules.mango = {pkgs, ...}: {
        imports = [
            self.nixosModules.wayland
            inputs.mangowm.nixosModules.mango
        ];
        environment.systemPackages = with pkgs; [
            wlr-randr
        ];
        programs.mango.enable = true;
        home-manager.sharedModules = [({ ... }: {
            home.file.".config/mango".source = ./.;
        })];
    };
}
