{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.tools.bottom;
in
{
  options.blastdan.tools.bottom = with types; {
    enable = mkBoolOpt false "Whether or not to enable Bottom.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bottom
    ];
  };
}