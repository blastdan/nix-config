{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.eza;
in
{
  options.blastdan.cli-apps.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
        l = "eza";
        la = "eza --group --header --group-directories-first --long --icons";
        ll = "eza --group --header --group-directories-first --long";
        lg = "eza --group --header --group-directories-first --long";
        le = "eza --group --header --group-directories-first --long --extended";
        lt = "eza --group --header --group-directories-first --tree --level LEVEL";
        lc = "eza --group --header --group-directories-first --across";
        lo = "eza --group --header --group-directories-first --oneline";
    };

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = true;
    };
  };
}
