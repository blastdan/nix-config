{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.languages.python;
in
{
  options.blastdan.languages.python = {
    enable = mkEnableOption "python";
  };

  config = mkIf cfg.enable {
     home.packages = with pkgs; [
        python3
        poetry
    ];
  };
}
