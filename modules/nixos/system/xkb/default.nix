{ options, config, lib, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.system.xkb;
in
{
  options.blastdan.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      layout = "us";
      xkbOptions = "caps:escape";
    };
  };
}
