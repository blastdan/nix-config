{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.xzoom;
in
{
  options.blastdan.cli-apps.xzoom = {
    enable = mkEnableOption "xzoom";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      xzoom
    ];
  };
}
