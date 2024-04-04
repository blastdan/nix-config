{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.tools.wget;
in
{
  options.blastdan.tools.wget = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable wget.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wget
    ];
    environment.sessionVariables = {
      WGETRC = "${XDG_CONFIG_HOME}/wget";
    };
  };
}
