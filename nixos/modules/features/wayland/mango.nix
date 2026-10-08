{ self, ...}: {
    flake.nixosModules.mango = {pkgs, ...}: {
        imports = [
            self.nixosModules.wayland
        ];
        # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
        home-manager.sharedModules = [({inputs, ... }: {
            imports = [
                inputs.mango.hmModules.mango
            ];
            wayland.windowManager.mango= {
                enable = true;
                settings = {
                    animations = 0;
                    bordercolor="0x595959aa";
                    bind = [
                        "SUPER,r,reload_config"
                        "SUPER,space,spawn,fuzzel"
                        "SUPER,Return,spawn,foot"
                    ];
                };
            };
        })];
    };
}
