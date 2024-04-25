{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.zellij;
in
{
  options.blastdan.cli-apps.zellij = {
    enable = mkEnableOption "zellij";
  };

  config = mkIf cfg.enable {
    home.file.".config/zellij/themes" = {
        recursive = true;
        source = ./themes;
    };

    home.file.".config/zellij/config.kdl" = {
        source = ./config.kdl;
    };

    programs.zellij = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
