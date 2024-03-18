{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.k9s;
in
{
  options.blastdan.cli-apps.k9s = {
    enable = mkEnableOption "k9s";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      k9s
    ];
  };
}
