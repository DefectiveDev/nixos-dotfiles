{ self, ... }: {
    # This is your configuration.nix, a place where you configure your system
    # You can place it in a separate file.
    flake.nixosModules.frameworkModule = { pkgs, ... }: {
        imports = [ # Include the results of the hardware scan.
            self.nixosModules.frameworkHardware
            self.nixosModules.homeManager
        ];

        programs.nix-ld.enable = true;

        # Use the systemd-boot EFI boot loader.
        boot = {
            loader = {
                systemd-boot.consoleMode = "2";
                systemd-boot.enable = true;
                efi.canTouchEfiVariables = true;
            };
            plymouth.enable = true;
            consoleLogLevel = 3;
            initrd.verbose = false;
            kernelParams = [
                "quiet"
                "splash"
                "boot.shell_on_fail"
                "udev.log_priority=3"
                "rd.systemd.show_status=auto"
            ];
            loader.timeout = 0;
        };

        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };

        hardware.keyboard.qmk.enable = true;

        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
                General = {
                    FastConnectable = true;
                };
                Policy = {
                    AutoEnable = true;
                };
            };
        };

        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowUnfreePredicate = (_: true);

        networking.hostName = "Framework-Nixos"; # Define your hostname.
        # networking options.
        networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

        # Set your time zone.
        time.timeZone = "America/New_York";

        services.displayManager.ly.enable = true;  

        # Enable sound.
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            wireplumber.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };
        services.pipewire.wireplumber.configPackages = [
            (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/10-bluez.conf" ''
             monitor.bluez.properties = {
             bluez5.enable-sbc-xq = true
             bluez5.enable-msbc = true
             bluez5.enable-hw-volume = true
             bluez5.roles = [hsp_hs hsp_ag hfp_hf hfp_ag]
             }
             '')
        ];

        # Enable touchpad support (enabled default in most desktopManager).
        # services.libinput.enable = true;
        
        #automount usb devices
        services.devmon.enable = true;
        services.gvfs.enable = true; 
        services.udisks2.enable = true;

        services.avahi = {
            enable = true;
            openFirewall = true;
        };

        services.flatpak.enable = true;

        xdg = {
            autostart.enable = true;
            mime.enable = true;
            menus.enable = true;
            icons.enable = true;
            sounds.enable = true;
            portal = {
                enable = true;
                wlr.enable = true;
                extraPortals = [
                    pkgs.xdg-desktop-portal-wlr
                    pkgs.xdg-desktop-portal-gnome
                    pkgs.xdg-desktop-portal-gtk
                    pkgs.xdg-desktop-portal-hyprland
                ];
            };
        };

        programs.niri = {
            enable = true;
        };

        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
        };

        programs.firefox.enable = true;
        programs.nix-index.enable = true;
        programs.zsh.enable = true;

        fonts = {
            packages = with pkgs; [
                nerd-fonts.fira-code
            ];
        };

        services.udev.packages = with pkgs; [
            qmk-udev-rules
        ];

        services.dnsmasq.enable = true;

        # List packages installed in system profile.
        # You can use https://search.nixos.org/ to find more packages (and options).
        environment.systemPackages = with pkgs; [
            vulkan-loader
                neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
                qmk
                wget
                git
                comma
                pulsemixer
                gnome-network-displays
                pulseaudio
                dnsmasq
                (pkgs.writeShellApplication {
                 name = "ns";
                 runtimeInputs = with pkgs; [
                 fzf
                 nix-search-tv
                 ];
                 text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
                 })
        ];


        # Define a user account. Don't forget to set a password with ‘passwd’.
        users.users.framework = {
            isNormalUser = true;
            extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
                shell = pkgs.zsh;
            packages = with pkgs; [
                tree
            ];
        };

        home-manager.users.framework = self.homeModules.frameworkModule;

        nix.settings.experimental-features = [ "nix-command" "flakes" ];


        # Open ports in the firewall.
        networking.firewall.allowedTCPPorts = [7236 7250];
        networking.firewall.allowedUDPPorts = [7236 5353];
        # Or disable the firewall altogether.
        # networking.firewall.enable = false;

        # Copy the NixOS configuration file and link it from the resulting system
        # (/run/current-system/configuration.nix). This is useful in case you
        # accidentally delete configuration.nix.
        # system.copySystemConfiguration = true;
        
        # This option defines the first version of NixOS you have installed on this particular machine,
        # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
        #
        # Most users should NEVER change this value after the initial install, for any reason,
        # even if you've upgraded your system to a new NixOS release.
        #
        # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
        # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
        # to actually do that.
        #
        # This value being lower than the current NixOS release does NOT mean your system is
        # out of date, out of support, or vulnerable.
        #
        # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
        # and migrated your data accordingly.
        #
        # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
        system.stateVersion = "25.05"; # Did you read the comment?

    };
}
