{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.helix;
in
{
  options.blastdan.cli-apps.helix = {
    enable = mkEnableOption "helix";
  };

  config = mkIf cfg.enable {

    home.file.".config/helix/themes" = {
        recursive = true;
        source = ./themes;
    };

    programs.helix = {
      enable = true;

      defaultEditor = true;

      extraPackages = [
        pkgs.marksman
        pkgs.terraform-ls
        pkgs.nil
      ];

      settings = {
        theme = "catppuccin_macchiato";

        editor = {
          line-number = "relative";
          cursorline = true;
          color-modes = true;
          true-color = true;

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          indent-guides = {
            render = true;
          };
        };
      };
    };
  };
}
