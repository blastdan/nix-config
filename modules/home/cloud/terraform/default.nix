{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cloud.terraform;
in
{
  options.blastdan.cloud.terraform = {
    enable = mkEnableOption "terraform";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      terraform
    ];
  };
}
