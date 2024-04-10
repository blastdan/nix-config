{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.languages.go;
in
{
  options.blastdan.languages.go = {
    enable = mkEnableOption "go";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      go
    ];
  };
}
