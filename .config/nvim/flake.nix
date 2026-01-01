{
    description = "Lua dev shell";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }: 
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
    in
    {

        devShell.${system} = pkgs.mkShell {
            name = "lua";
            packages = with pkgs; [ lua-language-server ];
        };

    };
}
