{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.tools.go-task;
in
{
  options.blastdan.tools.go-task = {
    enable = mkEnableOption "devbox";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      go-task
    ];
  };
}
