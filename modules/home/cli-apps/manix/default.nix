{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.manix;
in
{
  options.blastdan.cli-apps.manix = {
    enable = mkEnableOption "manix";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      manix
    ];
  };
}
