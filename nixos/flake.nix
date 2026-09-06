{
    description = "Defective NixOS Setup";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";

        unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nixos-hardware.url = "github:NixOS/nixos-hardware/master";

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

#Dendritic pattern needed files
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
    };

# TODO: Turn into flake parts.

    outputs = {self, nixpkgs, home-manager, nixos-hardware, flake-parts, import-tree, ...}@inputs: 
    # let
    #     system = "x86_64-linux";
    #     unstable-pkgs = import inputs.unstable-nixpkgs {
    #         inherit system;
    #         config = {allowUnfree=true;};
    #     };
    #     pkgs = import nixpkgs {
    #         inherit system;
    #         config = {allowUnfree=true;};
    #         # overlays = [ inputs.nur.overlay ];
    #     };
    # in
    # {
        inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
        # nixosConfigurations.framework-nixos = nixpkgs.lib.nixosSystem {
        #     inherit system;
        #     specialArgs = {inherit inputs; inherit unstable-pkgs;};
        #     modules = [
        #         ./system/configuration.nix
        #         inputs.nur.modules.nixos.default
        #         nixos-hardware.nixosModules.framework-16-7040-amd
        #         home-manager.nixosModules.home-manager
        #         {
        #             home-manager = {
        #                 extraSpecialArgs = {inherit inputs; inherit unstable-pkgs;};
        #                 useGlobalPkgs = true;
        #                 useUserPackages = true;
        #                 users.framework = import ./users/home.nix;
        #                 backupFileExtension = "backup";
        #             };
        #         }
        #     ];
        # };
#    homeConfigurations."framework@Framework-NixOS" = inputs.home-manager.lib.homeManagerConfiguration {
#     inherit pkgs;
#    extraSpecialArgs = { inherit inputs; inherit unstable-pkgs; };
#   modules = [
#    ./users/home.nix
#   inputs.nur.hmModules.nur
# ];
# };

        # devShell.${system} = pkgs.mkShell {
        #     name = "nix-dev";
        #     packages = with pkgs; [nil];
        # };
    # };
}
