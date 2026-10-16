{
    description = "Defective NixOS Setup";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";

        unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nixos-hardware.url = "github:NixOS/nixos-hardware/master";

        mangowm = {
            url = "github:mangowm/mango";
            inputs.nixpkgs.follows = "unstable-nixpkgs";
        };

        msnap = {
            url = "github:xtheeq/msnap";
            inputs.nixpkgs.follows = "unstable-nixpkgs";
        };

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "unstable-nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-index-database = {
            url = "github:nix-community/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        #Dendritic pattern needed files
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
    };

# TODO: Turn into flake parts.

    outputs = {...}@inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
