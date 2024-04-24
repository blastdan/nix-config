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

    programs.zellij = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      settings = {
        theme = "catppuccin-macchiato";
        mouse_mode = false;
      };
    };
  };
}
