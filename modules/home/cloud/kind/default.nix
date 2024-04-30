{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.cloud.kind;
in
{
  options.blastdan.cloud.kind = with types; {
    enable =
      mkBoolOpt false "Whether or not to install kind";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      kind
    ];
  };
}