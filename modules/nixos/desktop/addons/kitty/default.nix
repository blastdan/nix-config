{ config
, lib
, options
, pkgs
, ...
}:
with lib;
with lib.blastdan;
let
  inherit (lib) mkIf;

  cfg = config.blastdan.desktop.addons.kitty;
in
{
  options.blastdan.desktop.addons.kitty = {
    enable = mkBoolOpt false "Whether to enable kitty.";
  };

  config = mkIf cfg.enable {
    blastdan.desktop.addons.term = {
      enable = true;
      pkg = pkgs.kitty;
    };
  };
}