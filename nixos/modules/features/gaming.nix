
{ ... }: {
    flake.nixosModules.gaming = { lib, pkgs, config, ... }: {
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
            "steam"
            "steam-original"
            "steam-unwrapped"
            "steam-run"
        ];
        programs = {
            gamemode.enable = true;
            xwayland.enable = true; # steam uses xdisplay
            gamescope = {
                enable = true;
                capSysNice = true;
            };
            steam = {
                enable = true;
                gamescopeSession = {
                    enable = true;
                    steamArgs = [
                        "-tenfoot"
                        "-pipewire-dmabuf"
                        "-steamos3"
                    ];
                };
                # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
                # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
                localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
                extraPackages = with pkgs; [
                    jdk
                ];
            };
            java.enable = true;
            appimage = {
                enable = true;
                binfmt = true;
            };
        };
        hardware.bluetooth = {
            settings.General = {
                experimental = true;

                Privacy = "device";
                JustWorksRepairing = "always";
                Class = "0x000100";
                FastConnectable = true;
            };
        };
        services.blueman.enable = true;
        hardware.xpadneo.enable = true;
        boot = {
            extraModulePackages = with config.boot.kernelPackages; [xpadneo];
            extraModprobeConfig = ''
                options bluetooth disable_ertm=Y
            '';
        };
        hardware.xone.enable = true;
        environment.systemPackages = with pkgs; [
            mangohud
        ];
    };
}
