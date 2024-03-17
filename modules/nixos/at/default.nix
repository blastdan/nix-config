{ options, config, pkgs, lib, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.tools.at;
in
{
  options.blastdan.tools.at = with types; {
    enable = mkBoolOpt false "Whether or not to install at.";
    pkg = mkOpt package pkgs.blastdan.at "The package to install as at.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.pkg
    ];
  };
}