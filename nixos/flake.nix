{
    description = "Defective NixOS Setup";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";

        unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs = {
            # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
            # to have it up-to-date or simply don't specify the nixpkgs input
                nixpkgs.follows = "unstable-nixpkgs";
                home-manager.follows = "home-manager";
            };
        };

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {self, nixpkgs, home-manager, ...}@inputs: 
        let 
        system = "x86_64-linux";
    unstable-pkgs = import inputs.unstable-nixpkgs {
        inherit system;
        config = {allowUnfree=true;};
    };
    pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree=true;};
        # overlays = [ inputs.nur.overlay ];
    };
    in
    {
        nixosConfigurations.framework-nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {inherit inputs; inherit unstable-pkgs;};
            modules = [
                ./system/configuration.nix
                inputs.nur.modules.nixos.default
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        extraSpecialArgs = {inherit inputs; inherit unstable-pkgs;};
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.framework = import ./users/home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
        #    homeConfigurations."framework@Framework-NixOS" = inputs.home-manager.lib.homeManagerConfiguration {
        #     inherit pkgs;
        #    extraSpecialArgs = { inherit inputs; inherit unstable-pkgs; };
        #   modules = [
        #    ./users/home.nix
        #   inputs.nur.hmModules.nur
        # ];
        # };

        devShell.${system} = pkgs.mkShell {
            name = "nix-dev";
            packages = with pkgs; [nil];
        };
    };
}
