{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.languages.kcl;
in
{
  options.blastdan.languages.kcl = {
    enable = mkEnableOption "kcl";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kcl-cli
      blastdan.kcl-lsp
    ];
  };
}
