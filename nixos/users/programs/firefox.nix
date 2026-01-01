{config, pkgs, ...}:
{
# home.file."./.mozilla/firefox/default/extensions.json".source = ../../../.mozilla/firefox/default/extensions.json;

    programs.firefox = {
        enable = true;
        profiles."default" = {
            isDefault = true;
            bookmarks = [
            {
                name= "Bookmark-Bar";
                toolbar = true;
                bookmarks = [
                {
                    name = "NixOS-Sites";
                    bookmarks = [
                    {
                        name = "Home-Manager";
                        bookmarks = [
                        {
                            name = "Home-Manager-Docs";
                            tags = ["home-manager" "home" "manager"];
                            url = "https://nix-community.github.io/home-manager/";
                        }
                        {
                            name = "Home-Manager-Options";
                            tags = ["home-manager" "home" "manager" "options"];
                            url = "https://nix-community.github.io/home-manager/options.xhtml";
                        }
                        ];
                    }
                    {
                        name = "NixOS";
                        bookmarks = [
                        {
                            name = "NixOS-Pkgs";
                            tags = ["nix" "pkg"];
                            url = "https://search.nixos.org/packages";
                        }
                        {
                            name = "NixOS-Options";
                            tags = ["nix" "options"];
                            url = "https://search.nixos.org/options?";
                        }
                        ];
                    }
                    {
                        name = "NUR-Pkgs";
                        tags = ["nix" "pkg" "nur"];
                        url = "https://nur.nix-community.org/";
                    }
                    {
                        name = "MyNixOS";
                        tags = ["nix" "pkg" "MyNix"];
                        url = "https://mynixos.com";
                    }
                    ];
                }
                ];
            }
            ];
            extensions = with pkgs.nur.repos.rycee.firefox-addons; [
                vimium-c
                    ublock-origin
                    bitwarden
                    dracula-dark-colorscheme
                    don-t-fuck-with-paste
                    darkreader
                    flagfox
                    refined-github
            ];
        };
    };
}
