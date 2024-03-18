{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.gh;
in
{
  options.blastdan.cli-apps.gh = {
    enable = mkEnableOption "gh";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gh
    ];
  };
}
