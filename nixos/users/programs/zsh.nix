pkgs:
{

    home.sessionVariables = {
        # Colorful manuals
        MANPAGER = "sh -c 'col -bx | bat -l man -p'"; 
        MANROFFOPT = "-c";
        DIRENV_LOG_FORMAT = ""; #disable direnv log
    };

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
# For neovim to work previously: export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "''${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
        initContent = ''
            if [ ! "$TMUX" ]; then
                if tmux has-session -t main; then
                    exec tmux attach -t main
                else
                    exec tmux new -s main
                fi
            fi
            fastfetch
            autoload -Uz compinit && compinit
            zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        '';
        syntaxHighlighting = {
            enable = true;
            highlighters = [
                "brackets"
                "cursor"
            ];
            styles = {
                ## Comments
                comment="fg=#6272A4";
                ## Constants
                ## Entitites
                ## Functions/methods
                alias="fg=#50FA7B";
                suffix-alias="fg=#50FA7B";
                global-alias="fg=#50FA7B";
                function="fg=#50FA7B";
                command="fg=#50FA7B";
                precommand="fg=#50FA7B,italic";
                autodirectory="fg=#FFB86C,italic";
                single-hyphen-option="fg=#FFB86C";
                double-hyphen-option="fg=#FFB86C";
                back-quoted-argument="fg=#BD93F9";
                ## Keywords
                ## Built ins
                builtin="fg=#8BE9FD";
                reserved-word="fg=#8BE9FD";
                hashed-command="fg=#8BE9FD";
                ## Punctuation
                commandseparator="fg=#FF79C6";
                command-substitution-delimiter="fg=#F8F8F2";
                command-substitution-delimiter-unquoted="fg=#F8F8F2";
                process-substitution-delimiter="fg=#F8F8F2";
                back-quoted-argument-delimiter="fg=#FF79C6";
                back-double-quoted-argument="fg=#FF79C6";
                back-dollar-quoted-argument="fg=#FF79C6";
                ## Serializable / Configuration Languages
                ## Storage
                ## Strings
                command-substitution-quoted="fg=#F1FA8C";
                command-substitution-delimiter-quoted="fg=#F1FA8C";
                single-quoted-argument="fg=#F1FA8C";
                single-quoted-argument-unclosed="fg=#FF5555";
                double-quoted-argument="fg=#F1FA8C";
                double-quoted-argument-unclosed="fg=#FF5555";
                rc-quote="fg=#F1FA8C";
                ## Variables
                dollar-quoted-argument="fg=#F8F8F2";
                dollar-quoted-argument-unclosed="fg=#FF5555";
                dollar-double-quoted-argument="fg=#F8F8F2";
                assign="fg=#F8F8F2";
                named-fd="fg=#F8F8F2";
                numeric-fd="fg=#F8F8F2";
                ## No category relevant in spec
                unknown-token="fg=#FF5555";
                path="fg=#F8F8F2";
                path_pathseparator="fg=#FF79C6";
                path_prefix="fg=#F8F8F2";
                path_prefix_pathseparator="fg=#FF79C6";
                globbing="fg=#F8F8F2";
                history-expansion="fg=#BD93F9";
                #ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
                #ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
                #ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
                #ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
                back-quoted-argument-unclosed="fg=#FF5555";
                redirection="fg=#F8F8F2";
                arg0="fg=#F8F8F2";
                default="fg=#F8F8F2";
                cursor="standout";
            };
        };
        zsh-abbr.enable = true;
        zsh-abbr.abbreviations = {
            #hm = "home-manager switch --flake ~/.dotfiles/nixos";
            nxos = "sudo nixos-rebuild switch --flake ~/.nixos-dotfiles/nixos#framework-nixos";
        };
        shellAliases = {
            cat = "bat";
            #tp = "trash put";
        };
    };
}
