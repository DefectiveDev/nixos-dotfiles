{ self, inputs, ... }: {
    # This is your system configuration entry-point
    flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.frameworkModule
            inputs.nur.modules.nixos.default
            inputs.nixos-hardware.nixosModules.framework-16-7040-amd
            ({ ... }: {
                nixpkgs.overlays = [
                    inputs.msnap.overlays.default
                    (final: prev: {
                        unstable = import inputs.unstable-nixpkgs {
                            system = final.stdenv.hostPlatform.system;
                            config.allowUnfree = true;
                        };
                    })
                ];
            })
        ];
    };
}
