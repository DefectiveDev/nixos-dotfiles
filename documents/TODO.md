1. Set nvim to be able to access lsp executables from nix. 
Right now mason puts the binaries in a directory. It is set to the top level path so It can be
called. Maybe I can input extra info into lspconfig using direnv or having it in my path will be enough
this may resolve the need to have nixos to control neovim. While still having the benefit of
direnv of nix!
