{ self, inputs, ... }: {
    # This is your system configuration entry-point
    flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.frameworkModule
            inputs.nur.modules.nixos.default
            inputs.nixos-hardware.nixosModules.framework-16-7040-amd
            ({ ... }: {
                nixpkgs.overlays = [
                    (final: prev: {
                        unstable = import inputs.unstable-nixpkgs {
                            system = final.stdenv.hostPlatform.system;
                            # system = "x86_64-linux";
                            config.allowUnfree = true;
                        };
                    })
                ];
            })
        ];
    };
}
