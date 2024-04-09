{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cloud.tfenv;
in
{
  options.blastdan.cloud.tfenv = {
    enable = mkEnableOption "tfenv";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tfenv
    ];
  };
}
