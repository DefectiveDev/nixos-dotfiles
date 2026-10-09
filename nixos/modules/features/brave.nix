let
    braveGroupPolicy = {
        BraveRewardsDisabled = true;
        BraveWalletDisabled = true;
        BraveAIChatEnabled = false;
        BraveNewsDisabled = true;
        BraveTalkDisabled = true;
        BraveStatsPingEnabled = false;
        BraveVPNDisabled = true;
        PasswordManagerEnabled = false;
    };
in
{ ... }: {
    flake.nixosModules.brave = { pkgs, ... }: {
        environment.etc."/brave/policies/managed/GroupPolicy.json".source =
            pkgs.writeText "GroupPolicy.json" (builtins.toJSON braveGroupPolicy);
        home-manager.sharedModules = [({ ... }: {
            programs.brave = {
                enable = true;
                extensions = [
                    "nngceckbapebfimnlniiiahkandclblb" # bitwarden
                    "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
                    "jghecgabfgfdldnmbfkhmffcabddioke" # volume master
                    "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # privacy badger
                    "aefkmifgmaafnojlojpnekbpbmjiiogg" # Popup Blocker (strict)
                    "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube
                    "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
                ];
                commandLineArgs = [
                    "--disable-features=AutofillSavePaymentMethods"
                ];
            };
        })];
    };
}
