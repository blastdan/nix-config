{ config
, lib
, options
, pkgs
, ...
}:
with lib;
with lib.blastdan;
let
  cfg = config.blastdan.tools.node;
in
{
  options.blastdan.tools.node = with types; {
    enable = mkBoolOpt false "Whether or not to install and configure git";
    pkg = mkOpt package pkgs.nodejs-18_x "The NodeJS package to use";
  };

  config = mkIf cfg.enable {
    environment.systemPackages =
      [ cfg.pkg ];
  };
}
