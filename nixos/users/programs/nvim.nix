{ pkgs, config, lib, ... }:
let
treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
            p.bash
            p.comment
            p.css
            p.dockerfile
            p.fish
            p.gitattributes
            p.gitignore
            p.go
            p.gomod
            p.gowork
            p.hcl
            p.javascript
            p.jq
            p.json5
            p.json
            p.lua
            p.make
            p.markdown
            p.nix
            p.python
p.rust
p.toml
p.typescript
p.vue
p.yaml
]));
in
{
    # home.sharedModules = [ 
    #     {
    #         stylix.targets.vim.enable = false;
    #     }
    # ];

    home.packages = with pkgs; [
        fd
            rustup
            gcc
            tree-sitter
# lua-language-server
# fzf # set up in home.nix
    ];

    home.activation.nvim = lib.mkAfter ''
        rm -rf $HOME/.config/nvim

        ln -sf $HOME/.nixos-dotfiles/.config/nvim $HOME/.config/nvim
    '';

    # home.file.".config/nvim" = { source = ../../../.config/nvim; recursive = true; };
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;

        plugins = [
            treesitterWithGrammars
        ];
    };

    home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
        recursive = true;
        source = treesitterWithGrammars;
    };

# programs.opam.enable = true; # ocaml stuff
# programs.pyenv.enable = true; # python env per user
# programs.rbenv.enable = true; # ruby env per user

# programs.ripgrep.enable = true; # managing in home.nix

}
