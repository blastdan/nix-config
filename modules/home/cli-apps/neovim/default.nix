{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.neovim;
in
{
  options.blastdan.cli-apps.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      blastdan.neovim
      ripgrep
    ];
  };
}
