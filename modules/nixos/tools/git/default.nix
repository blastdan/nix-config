{ options, config, pkgs, lib, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.tools.git;
in
{
  options.blastdan.tools.git = with types; {
    enable = mkBoolOpt false "Whether or not to install and configure git.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ git ];
  };
}
