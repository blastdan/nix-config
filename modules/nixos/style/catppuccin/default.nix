{ lib, config, pkgs, options, ... }:
with lib;
with lib.blastdan;
let
  cfg = config.blastdan.style.catppuccin;
in
{
  options.blastdan.style.catppuccin = {
    enable = mkEnableOption "catppuccin";
    flavour = mkOpt types.str "macchiato" "The falvour to install";
  };

  config = mkIf cfg.enable {
    catppuccin.flavour = cfg.flavour;
    catppuccin.enable = true;
  };
}
