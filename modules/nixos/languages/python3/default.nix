{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.languages.python3;
in
{
  options.blastdan.languages.python3 = with types; {
    enable = mkBoolOpt false "Whether or not to enable python3.";
  };

  config =
    mkIf cfg.enable { 
        environment.systemPackages = with pkgs; [ 
            python312
        ]; 
    };
}