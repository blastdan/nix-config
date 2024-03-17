{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.apps.google-chrome;
in
{
  options.blastdan.apps.google-chrome = with types; {
    enable = mkBoolOpt false "Whether or not to enable Google Chrome";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ google-chrome ]; };
}
