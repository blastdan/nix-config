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

  cfg = config.blastdan.desktop.addons.alacritty;
in
{
  options.blastdan.desktop.addons.alacritty = {
    enable = mkBoolOpt false "Whether to enable alacritty.";
  };

  config = mkIf cfg.enable {
    blastdan.desktop.addons.term = {
      enable = true;
      pkg = pkgs.alacritty;
    };
  };
}