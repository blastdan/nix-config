{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.gh-dash;
in
{
  options.blastdan.cli-apps.gh-dash = {
    enable = mkEnableOption "gh";
  };

  config = mkIf cfg.enable {
    programs.gh-dash = {
        enable = true;
    };
  };
}
