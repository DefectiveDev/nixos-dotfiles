{ inputs, ... }: {
    imports = [
        # adds home-manager options to flake-parts
        inputs.home-manager.flakeModules.home-manager
    ];

    systems = [
        "x86_64-linux"
        # "aarch64-linux"
        # "x86_64-darwin"
        # "aarch64-darwin"
    ];

    perSystem = { pkgs, system, ...}: {
        _module.args = {
            pkgs = import inputs.nixpkgs {
                inherit system;
                    config = {
                    allowUnfree = true;
                };
            };

            unstable-pkgs = import inputs.unstable-nixpkgs {
                inherit system;
                    config = {
                    allowUnfree = true;
                };
            };
        };

        devShells.default = pkgs.mkShell {
            name = "nix-dev";
            packages = with pkgs; [nil];
        };
    };
}
