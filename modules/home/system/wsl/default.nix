{ config
, lib
, options
, pkgs
, ...
}:
with lib;
with lib.blastdan;
let
  cfg = config.blastdan.system.wsl;
in
{
  options.blastdan.system.wsl = {
    enable =
      mkBoolOpt false "Whether or not to enable the wsl archetype.";
  };

  config = mkIf cfg.enable {
    home = {
      sessionVariables = {
        BROWSER = "wsl-open";
      };

      packages = with pkgs; [
        dos2unix
        wsl-open
        wslu
      ];
    };
  };
}
