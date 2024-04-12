{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.asciiquarium;
in
{
  options.blastdan.cli-apps.asciiquarium = {
    enable = mkEnableOption "asciiquarium";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      asciiquarium-transparent
    ];

    programs.zsh.shellAliases = {
      pause = "asciiquarium --transparent";
    };
  };
}
