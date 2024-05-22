{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cloud.terraformer;
in
{
  options.blastdan.cloud.terraformer = {
    enable = mkEnableOption "terraform";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      terraformer
    ];

    programs.zsh.shellAliases = {
      tf = "terraform";
    };
  };
}
