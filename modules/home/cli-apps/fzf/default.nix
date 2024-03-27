{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.cli-apps.fzf;
in
{
  options.blastdan.cli-apps.fzf = with types; {
    enable = mkBoolOpt false "Whether or not to enable fzf.";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
