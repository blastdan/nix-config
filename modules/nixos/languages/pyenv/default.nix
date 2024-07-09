{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.languages.pyenv;
in
{
  options.blastdan.languages.pyenv = with types; {
    enable = mkBoolOpt false "Whether or not to enable pyenv.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ pyenv ]; };
}