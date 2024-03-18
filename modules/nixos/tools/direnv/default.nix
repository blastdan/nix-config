{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.tools.direnv;
in
{
  options.blastdan.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    blastdan.home.extraOptions = {
      programs.direnv = {
        enable = true;
        nix-direnv = enabled;
      };
    };
  };
}
