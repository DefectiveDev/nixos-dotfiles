{ self, ... }: 
{
    flake.nixosModules.wayland = {pkgs, ...}: 
    {
        xdg = {
            autostart.enable = true;
            mime.enable = true;
            menus.enable = true;
            icons.enable = true;
            sounds.enable = true;
            portal = {
                enable = true;
                wlr = {
                    enable = true;
                    settings = {
                      screencast = {
                        output_name = "eDP-2";
                        max_fps = 60;
                        # exec_before = "disable_notifications.sh";
                        # exec_after = "enable_notifications.sh";
                        chooser_type = "dmenu";
                        chooser_cmd = "${pkgs.wofi}/bin/wofi --show=dmenu --prompt='Select the output to share' --insensitive";
                      };
                    }
                    ;
                };
                extraPortals = [
                    pkgs.xdg-desktop-portal-gnome
                    pkgs.xdg-desktop-portal-gtk
                ];
            };
        };

        home-manager.sharedModules = [({ ... }: {
                imports = [
                self.homeModules.wofi
                ];
                home.sessionVariables.NIXOS_OZONE_WL = "1"; #tell electron apps to use wayland
                home.packages = with pkgs; [
                slurp#capture wayland region
                wl-clipboard
                wl-clip-persist #when application closes this will keep the items saved
                grim #screenshots
                ];
                })];
    };
               }
