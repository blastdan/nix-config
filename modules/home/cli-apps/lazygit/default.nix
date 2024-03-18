{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.lazygit;
in
{
  options.blastdan.cli-apps.lazygit = {
    enable = mkEnableOption "lazygit";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lazygit
    ];
  };
}
