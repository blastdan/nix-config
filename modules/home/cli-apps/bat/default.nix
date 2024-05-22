{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.bat;
in
{
  options.blastdan.cli-apps.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf cfg.enable {
    programs.zsh.shellAliases = {
      cat = "bat";
    };

    programs.bat = {
      enable = true;
      catppuccin.enable = config.blastdan.style.catppuccin.enable;
    };
  };
}
