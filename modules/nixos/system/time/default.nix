{ options, config, pkgs, lib, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.system.time;
in
{
  options.blastdan.system.time = with types; {
    enable =
      mkBoolOpt false "Whether or not to configure timezone information.";
  };

  config = mkIf cfg.enable { time.timeZone = "America/Los_Angeles"; };
}
