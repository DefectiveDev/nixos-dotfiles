{ self, ...}: {
    flake.nixosModules.hyprland = {pkgs, ...}: {
        imports = [
            self.nixosModules.wayland
        ];
        xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
        home-manager.sharedModules = [({ ... }: {
            home.file.".config/hypr".source = ./._hyprland;
            home.packages = with pkgs; [
                hyprpaper
                socat #for socket connections used in hyprland
            ];
        })];
    };
}
