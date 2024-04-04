{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.zoxide;
in
{
  options.blastdan.cli-apps.zoxide = {
    enable = mkEnableOption "gh";
  };

  config = mkIf cfg.enable {
    programs.zoxide = {
        enable = true;

        enableZshIntegration = true;

    };
  };
}
