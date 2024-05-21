{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.gh;
in
{
  options.blastdan.cli-apps.gh = {
    enable = mkEnableOption "gh";
  };

  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
      settings = {
        git_protocol = "https";
        prompt = "enabled";
        aliases = {
          co = "pr checkout";
          pv = "pr view";
        };
      };
      extensions = [
        pkgs.gh-dash
        pkgs.gh-eco
        pkgs.gh-markdown-preview
        pkgs.blastdan.gh-poi
      ];
    };

    programs.gh-dash = {
      catppuccin.enable = config.blastdan.style.catppuccin.enable;
    };
  };
}
