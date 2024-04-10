{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.nix-prefetch-github;
in
{
  options.blastdan.cli-apps.nix-prefetch-github = {
    enable = mkEnableOption "nix-prefetch-github";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nix-prefetch-github
    ];
  };
}
