{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.tools.devbox;
in
{
  options.blastdan.tools.devbox = {
    enable = mkEnableOption "devbox";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      devbox
    ];
  };
}
