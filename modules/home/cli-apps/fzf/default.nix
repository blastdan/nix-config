{ config
, lib
, options
, pkgs
, ...
}:
with lib;
with lib.blastdan;
let
  cfg = config.blastdan.cli-apps.fzf;
in
{
  options.blastdan.cli-apps.fzf = {
    enable = mkBoolOpt false "Whether or not to enable fzf.";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      package = pkgs.fzf;

      catppuccin.enable = config.blastdan.style.catppuccin.enable;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}