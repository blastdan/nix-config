{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cloud.terragrunt;
in
{
  options.blastdan.cloud.terragrunt = {
    enable = mkEnableOption "terragrunt";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      terragrunt
    ];
  };
}
