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
    environment = {
      noXlibs = mkForce false;

      sessionVariables = {
        BROWSER = "wsl-open";
      };

      systemPackages = with pkgs; [
        dos2unix
        wsl-open
        wslu
      ];
    };
  };
}
