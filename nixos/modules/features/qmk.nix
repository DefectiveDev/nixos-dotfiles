{ ... }: {
    flake.nixosModules.qmk = { pkgs, ... }: {
        hardware.keyboard.qmk.enable = true;

        services.udev.packages = with pkgs; [
            qmk-udev-rules
        ];

        environment.systemPackages = with pkgs; [
            qmk
        ];
    };
}
