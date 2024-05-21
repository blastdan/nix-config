{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;
  cfg = config.blastdan.cli-apps.k9s;
in
{
  options.blastdan.cli-apps.k9s = {
    enable = mkEnableOption "k9s";
  };

  config = mkIf cfg.enable {
    # home.file.".config/k9s/skins" = {
    #     recursive = true;
    #     source = ./skins;
    # };

    programs.k9s = {
      enable = true;

      aliases = {
        aliases = {
          pp = "v1/pods"; 
        };
      };

      catppuccin = mkIf (config.blastdan.style.catppuccin.enable) {
        enable = true;
        transparent = true;
      };

      settings = {
        k9s = {
          liveViewAutoRefresh = false;
          refreshRate = 2;
          maxConnRetry = 5;
          readOnly = false;
          ui = {
            enableMouse = true;
            headless = false;
            logoless = false;
            crumbsless = false;
            noIcons = false;
            reactive = false;
            # skin = "catppuccin-macchiato-transparent";
          };
        };
      };
    };
  };
}
