{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.apps.slack;
in
{
  options.blastdan.apps.slack = with types; {
    enable = mkBoolOpt false "Whether or not to enable slack.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ slack ]; };
}
